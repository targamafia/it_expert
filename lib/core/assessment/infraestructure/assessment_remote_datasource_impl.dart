import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:it_expert/core/assessment/domain/dto/AssessmentAvailableDto.dart';
import 'package:it_expert/core/assessment/domain/dto/grade_report_dto.dart';
import 'package:it_expert/core/assessment/domain/dto/graded_assessment_dto.dart';
import 'package:it_expert/core/assessment/domain/dto/premium_assessment_dto.dart';
import 'package:it_expert/core/utils/result.dart';
import '../../api/api.dart';
import '../application/assessment_remote_datasource_interface.dart';
import '../domain/dto/assessment_dto.dart';
import '../domain/dto/grade_assessment_response_dto.dart';
import '../domain/dto/question_dto.dart';
import '../domain/exceptions/no_questions_for_assessment_exception.dart';

class AssessmentRemoteDataSourceImpl
    implements AssessmentRemoteDataSourceInterface {
  @override
  Future<Result> fetchFeaturedAssessments() async {
    var response = await API.get("/assessments/featured");
    var json = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    switch (response.statusCode) {
      case HttpStatus.ok:
        var featuredAssessments =
            json['entity']['list'].map<AssessmentDto>((it) {
          return AssessmentDto(
              id: it['id'],
              title: it['title'],
              categories: asListOfStrings(it['categories']),
              thumbnailUrl:
                  it['thumbnailUrl'] ?? 'http://placeimg.com/640/480/arch',
              isPremium: it['isPremium'],
              description: it['description'] ?? '',
              rating: (it['rating'] as int) * 1.0,
              isPrivate: it['isPrivate'],
              questions: []);
        }).toList();
        return Result.success(featuredAssessments);
    }
    return Result.failure(
      const HttpException(
          "Cannot Perform operation (fetchFeaturedAssessments)"),
    );
  }

  @override
  Future<Result> fetchAssessment(String id) async {
    var response = await API.get("/assessments/$id");
    var json = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    switch (response.statusCode) {
      case HttpStatus.ok:
        var a = json["entity"];

        if (asListOfQuestionDto(json["entity"]["questions"]).isEmpty) {
          return Result.failure(
            NoQuestionsForAssessmentException(
                "El examen seleccionado no tiene preguntas!, intenta con otro"),
          );
        }
        AssessmentDto assessmentDto = AssessmentDto(
            id: a["_id"],
            title: a["title"],
            description: a["description"] ?? "",
            thumbnailUrl: a["thumbnailUrl"] ?? "",
            isPrivate: a["isPrivate"] ?? false,
            isPremium: a["isPremium"] ?? false,
            categories: asListOfStrings(a["categories"] ?? []),
            rating: (a["rating"] as int) * 1.0,
            questions: asListOfQuestionDto(json["entity"]["questions"] ?? []));
        return Result.success(assessmentDto);
    }
    return Result.failure(
      const HttpException("Cannot Perform operation (fetchAssessment)"),
    );
  }

  @override
  Future<Result> gradeAssessment(
      Map<String, String> questionsAnswer, String assessmentId) async {
    List<Map<String, dynamic>> listQuestionAnswers =
        toGradeAsssessmentBodyFormat(questionsAnswer);

    var response = await API.post("/grade",
        body: jsonEncode(
          <String, dynamic>{
            "startDate": DateTime.now().toLocal().toIso8601String(),
            "assessmentId": assessmentId,
            "givenAnswers": listQuestionAnswers
          },
        ));

    var json = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    if (response.statusCode != HttpStatus.created) {
      return Result.failure(HttpException(response.body));
    }

    json["entity"]["gradeId"] = ""; // TODO: correct code smell.
    json["entity"]["answers"] = []; // TODO: correct code smell.
    return Result.success(
      GradeAssessmentResponseDto.fromJson(json["entity"]),
    );
  }

  @override
  Future<Result> fetchAssessmentGradeWithAnswersByGradeId(
      String gradeId) async {
    var response = await API.get("/grade/$gradeId/user/");
    var json = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    if (response.statusCode != HttpStatus.ok) {
      return Result.failure(HttpException(response.body));
    }

    print("jsonResponse: $json");
    json["entity"]["gradeId"] = gradeId;
    return Result.success(
      GradeAssessmentResponseDto.fromJson(json["entity"]),
    );
  }

  List<Map<String, dynamic>> toGradeAsssessmentBodyFormat(
      Map<String, String> questionsAnswer) {
    List<Map<String, dynamic>> listQuestionAnswers = [];
    questionsAnswer.forEach(
      (key, value) => listQuestionAnswers.add(
        Map.fromEntries(
          [MapEntry("questionId", key), MapEntry("optionId", value)],
        ),
      ),
    );
    return listQuestionAnswers;
  }

  @override
  Future<Result> fetchAssessmentGrade(String assessmentId) {
    return Future.delayed(const Duration(seconds: 5), () {
      return Result.success(75);
    });
  }

  @override
  Future<Result> fetchAllAssessments() async {
    var response = await API.get("/assessments");
    var json = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    switch (response.statusCode) {
      case HttpStatus.ok:
        var assessments = json['entity']['list'].map<AssessmentDto>((it) {
          return AssessmentDto(
              id: it['id'],
              title: it['title'],
              categories: asListOfStrings(it['categories']),
              thumbnailUrl:
                  it['thumbnailUrl'] ?? 'http://placeimg.com/640/480/arch',
              isPremium: it['isPremium'],
              description: it['description'] ?? '',
              rating: (it['rating'] as int) * 1.0,
              isPrivate: it['isPrivate'],
              questions: []);
        }).toList();
        return Result.success(assessments);
    }
    return Result.failure(
      const HttpException("Cannot Perform operation (fetchAllAssessments)"),
    );
  }

  @override
  Future<Result> fetchAllGradedAssessments(String userId) async {
    var response = await API.get("/grade/user/me/");
    var json = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    switch (response.statusCode) {
      case HttpStatus.ok:
        return Result.success(
            asListOfGradedAssessmentDto(json["entity"]["list"]));
    }
    return Result.failure(
        HttpException("Exception while fetching all graded assessmetns"));
  }

  @override
  Future<Result> fetchUserPremiumAssessments(String userId) async {
    print("Fetching premium assessments");
    var response = await API.get("/assessments/premium-access/me");
    var json = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    switch (response.statusCode) {
      case HttpStatus.ok:
        return Result.success(
          (json["entity"] as List<dynamic>).asLisOfAssessmentDto(),
        );
    }
    return Result.failure(HttpException(
        "Exception while fetching all user's premium assessmetns"));
  }

  Future<Result> fetchBestAssessments() async {
    var response = await API.get("/assessments/top-rated");
    var json = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    switch (response.statusCode) {
      case HttpStatus.ok:
        var featuredAssessments =
            json['entity']['list'].map<AssessmentDto>((it) {
          return AssessmentDto(
              id: it['id'],
              title: it['title'],
              categories: asListOfStrings(it['categories']),
              thumbnailUrl:
                  it['thumbnailUrl'] ?? 'http://placeimg.com/640/480/arch',
              isPremium: it['isPremium'],
              description: it['description'] ?? '',
              rating: (it['rating'] as int) * 1.0,
              isPrivate: it['isPrivate'],
              questions: []);
        }).toList();
        return Result.success(featuredAssessments);
    }
    return Result.failure(
      const HttpException(
          "Cannot Perform operation (fetchFeaturedAssessments)"),
    );
  }

  @override
  Future<Result> fetchAssessmentAttemps(String assessmentId) async {
    var response =
        await API.get("/grade/report/user/me/assessment/$assessmentId");
    var json = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    switch (response.statusCode) {
      case HttpStatus.ok:
        var entitiy = json["entity"];
        return Result.success(GradeReportDto(
            assessmentId: entitiy["assessmentId"],
            remainingAttemps: entitiy["attempts"],
            bestGrade: entitiy["bestGrade"] * 1.0,
            isAvailable: entitiy["isAvailable"] ?? false));
    }
    return Result.failure(
        HttpException("Error while performing fetchAssessmentAttemps"));
  }

  @override
  Future<Result> isAvailable(String assessmentId) async {
    var response = await API.get("/assessments/$assessmentId/is-available/me");
    var json = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    switch (response.statusCode) {
      case HttpStatus.ok:
        return Result.success(AssessmentAvailableDto.fromJson(json));
    }
    return Result.failure(
        HttpException("Error while performing isAvailable($assessmentId)"));
  }
}

List<String> asListOfStrings(List<dynamic> list) {
  List<String> acc = [];
  for (var item in list) {
    acc.add(item.toString());
  }
  return acc;
}

List<QuestionDto> asListOfQuestionDto(List<dynamic> list) {
  List<QuestionDto> questions = [];
  for (var item in list) {
    questions.add(
      QuestionDto(
          id: item["_id"],
          text: item["title"],
          answers: asListOfAnswerDto(item["options"]),
          imageUrl: item["imageUrl"] ?? ""),
    );
  }
  return questions;
}

List<GradedAssessmentDto> asListOfGradedAssessmentDto(List<dynamic> list) {
  List<GradedAssessmentDto> assessments = [];
  for (var entity in list) {
    if (entity["assessment"] == null) continue;
    var title = entity["assessment"]["title"];
    String thumbnailUrl = entity["assessment"]["thumbnailUrl"];
    if (thumbnailUrl.isEmpty) {
      thumbnailUrl = "http://placeimg.com/640/480/arch";
    }

    print("assessmentId: ${entity["assessment"]["id"]}");

    assessments.add(GradedAssessmentDto(
      gradeId: entity["id"],
      title: title ?? "",
      thumbnailUrl: thumbnailUrl,
      id: entity["assessment"]["id"],
      startDate: DateTime.parse(entity["startDate"]),
      endDate: DateTime.parse(entity["endDate"]),
      grade: entity["grade"] * 1.0,
      correctAnswers: entity["correctAnswers"],
      wrongAnswers: entity["wrongAnswers"],
    ));
  }
  return assessments.reversed.toList();
}

List<PremiumAssessmentDto> asListOfPremiumAssessmentDto(List<dynamic> list) {
  List<PremiumAssessmentDto> assessments = [];
  for (var entity in list) {
    assessments.add(PremiumAssessmentDto(
        id: entity["id"],
        title: entity["title"],
        attempts: entity["attempts"]));
  }
  return assessments;
}

List<AnswerDto> asListOfAnswerDto(List<dynamic> list) {
  List<AnswerDto> answers = [];
  for (var answer in list) {
    answers.add(AnswerDto(answer["_id"], answer["value"]));
  }
  return answers;
}

extension AssessmentMapper on List<dynamic> {
  List<AssessmentDto> asLisOfAssessmentDto() {
    List<AssessmentDto> lst = [];
    for (final assessment in this) {
      lst.add(AssessmentDto(
          id: assessment["id"],
          title: assessment["title"] ?? "",
          description: assessment["description"] ?? "",
          thumbnailUrl:
              assessment["thumbnailUrl"] ?? "http://placeimg.com/640/480/arch",
          isPrivate: assessment["isPrivate"],
          isPremium: assessment["isPremium"],
          categories: asListOfStrings(assessment["categories"]),
          rating: assessment["rating"] * 1.0,
          questions: []));
    }
    return lst;
  }
}

class PostQuestionAnswersDto {
  final String assessmentId;
  final List<dynamic> givenAnswers;

  PostQuestionAnswersDto(
      {required this.assessmentId, required this.givenAnswers});
}
