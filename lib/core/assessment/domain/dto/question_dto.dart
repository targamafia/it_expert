class QuestionDto {
  final String id;
  final String text;
  final String imageUrl;
  final List<AnswerDto> answers;

  QuestionDto(
      {required this.id,
      required this.text,
      required this.answers,
      required this.imageUrl});

  @override
  String toString() {
    return """QuestionDto {
      id: $id, 
      text: $text, 
      imageUrl: $imageUrl, 
      answers: $answers
    }""";
  }
}

class AnswerDto {
  final String id;
  final String text;

  AnswerDto(this.id, this.text);

  @override
  String toString() {
    return 'AnswerDto{id: $id, text: $text}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnswerDto &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          text == other.text;

  @override
  int get hashCode => id.hashCode ^ text.hashCode;
}
