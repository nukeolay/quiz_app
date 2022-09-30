class Answer {
  final String text;
  final bool isCorrect;
  const Answer({required this.text, required this.isCorrect});
}

class Answers {
  final List<Answer> answers;
  const Answers({required this.answers});
}
