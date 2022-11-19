class TopRatedAssessmentDto {
  final String id;
  final String title;
  final String description;
  final String thumbnailUrl;
  final bool isPrivate;
  final bool isPremium;
  final List<String> categories;
  final double rating;

  TopRatedAssessmentDto(
      {required this.id,
      required this.title,
      required this.description,
      required this.thumbnailUrl,
      required this.isPrivate,
      required this.isPremium,
      required this.categories,
      required this.rating});

  @override
  String toString() {
    return 'TopRatedAssessmentDto{id: $id, title: $title, description: $description, thumbnailUrl: $thumbnailUrl, isPrivate: $isPrivate, isPremium: $isPremium, categories: $categories, rating: $rating}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TopRatedAssessmentDto &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
