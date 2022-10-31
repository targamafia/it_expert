import 'package:it_expert/core/assessment/domain/dto/question_dto.dart';

class AssessmentDto {
  final String id;
  final String title;
  final String description;
  final String thumbnailUrl;
  final bool isPrivate;
  final bool isPremium;
  final List<String> categories;
  final double rating;
  final List<QuestionDto> questions;

  AssessmentDto(
      {required this.id,
      required this.title,
      required this.description,
      required this.thumbnailUrl,
      required this.isPrivate,
      required this.isPremium,
      required this.categories,
      required this.rating,
      required this.questions});

  @override
  String toString() {
    return 'FeaturedAssessmentDto{id: $id, title: $title, description: $description, thumbnailUrl: $thumbnailUrl, isPrivate: $isPrivate, isPremium: $isPremium, categories: $categories, rating: $rating}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssessmentDto &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
