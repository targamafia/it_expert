import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:it_expert/core/assessment/domain/dto/post_grade_assessment_dto.dart';

import 'package:it_expert/core/utils/result.dart';

import '../../api/api.dart';
import '../application/assessment_remote_datasource_interface.dart';
import '../domain/dto/assessment_dto.dart';
import '../domain/dto/question_dto.dart';

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
        AssessmentDto assessmentDto = AssessmentDto(
            id: a["_id"],
            title: a["title"],
            description: a["description"],
            thumbnailUrl: a["thumbnailUrl"],
            isPrivate: a["private"],
            isPremium: a["isPremium"],
            categories: asListOfStrings(a["categories"]),
            rating: (a["rating"] as int) * 1.0,
            questions: asListOfQuestionDto(json["entity"]["questions"]));
        return Result.success(assessmentDto);
    }
    return Result.failure(
      const HttpException("Cannot Perform operation (fetchAssessment)"),
    );
  }

  @override
  Future<Result> gradeAssessment(
      Map<String, String> questionsAnswer, String assessmentId) async {
    List<Map<String, dynamic>> listQuestionAnswers = [];
    questionsAnswer.forEach(
      (key, value) => listQuestionAnswers.add(
        Map.fromEntries(
          [MapEntry("questionId", key), MapEntry("optionId", value)],
        ),
      ),
    );

    var jsonBody = jsonEncode(
      <String, dynamic>{
        "assessmentId": assessmentId,
        "givenAnswers": listQuestionAnswers
      },
    );
    var response = await API.post("/grade",
        body: jsonEncode(
          <String, dynamic>{
            "assessmentId": assessmentId,
            "givenAnswers": listQuestionAnswers
          },
        ));
    var json = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    if (response.statusCode == HttpStatus.created) {
      var entity = json["entity"];
      return Result.success(
        PostGradeAssessmentDto(
          id: entity["id"],
          startDate: DateTime.parse(entity["startDate"]),
          endDate: DateTime.parse(entity["endDate"]),
          grade: entity["grade"] * 1.0,
          correctAnswers: entity["correctAnswers"],
          wrongAnswers: entity["wrongAnswers"],
        ),
      );
    } else {
      return Result.failure(HttpException(response.body));
    }
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
        var assessments =
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
        return Result.success(assessments);
    }
    return Result.failure(
      const HttpException("Cannot Perform operation (fetchAllAssessments)"),
    );
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
    questions.add(QuestionDto(
        item["_id"], item["title"], asListOfAnswerDto(item["options"])));
  }
  return questions;
}

List<AnswerDto> asListOfAnswerDto(List<dynamic> list) {
  List<AnswerDto> answers = [];
  for (var answer in list) {
    answers.add(AnswerDto(answer["_id"], answer["value"]));
  }
  return answers;
}

class PostQuestionAnswersDto {
  final String assessmentId;
  final List<dynamic> givenAnswers;

  PostQuestionAnswersDto(
      {required this.assessmentId, required this.givenAnswers});
}
