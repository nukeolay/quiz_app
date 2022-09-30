class QuizViewModelState {
  final String difficulty;
  final String category;
  final String question;
  final List<String> answers;
  final List<bool> userAnswers;
  final bool isMultipleCorrectAnswers;

  QuizViewModelState({
    this.difficulty = '',
    this.category = '',
    this.question = '',
    this.answers = const [],
    this.userAnswers = const [],
    this.isMultipleCorrectAnswers = false,
  });

  QuizViewModelState copyWith({
    String? difficulty,
    String? category,
    String? question,
    List<String>? answers,
    List<bool>? userAnswers,
    bool? isMultipleCorrectAnswers,
  }) {
    return QuizViewModelState(
      difficulty: difficulty ?? this.difficulty,
      category: category ?? this.category,
      question: question ?? this.question,
      answers: answers ?? this.answers,
      userAnswers: userAnswers ?? this.userAnswers,
      isMultipleCorrectAnswers:
          isMultipleCorrectAnswers ?? this.isMultipleCorrectAnswers,
    );
  }
}
