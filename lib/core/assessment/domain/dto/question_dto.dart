class QuestionDto {
  final String id;
  final String text;
  final List<AnswerDto> answers;

  QuestionDto(this.id, this.text, this.answers);

  @override
  String toString() {
    return 'QuestionDto{id: $id, text: $text, answers: $answers}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionDto &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          text == other.text &&
          answers == other.answers;

  @override
  int get hashCode => id.hashCode ^ text.hashCode ^ answers.hashCode;
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
