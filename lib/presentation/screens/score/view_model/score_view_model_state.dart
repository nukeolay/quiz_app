class ScoreViewModelState {
  final String difficulty;
  final String category;
  final int wrongAnswers;
  final int correctAnswers;
  final int dateTime;
  final bool isLoading;
  final bool isError;

  ScoreViewModelState({
    this.difficulty = '',
    this.category = '',
    this.wrongAnswers = 0,
    this.correctAnswers = 0,
    this.dateTime = 0,
    this.isLoading = false,
    this.isError = false,
  });

  ScoreViewModelState copyWith({
    String? difficulty,
    String? category,
    int? wrongAnswers,
    int? correctAnswers,
    int? dateTime,
    bool? isLoading,
    bool? isError,
  }) {
    return ScoreViewModelState(
      difficulty: difficulty ?? this.difficulty,
      category: category ?? this.category,
      wrongAnswers: wrongAnswers ?? this.wrongAnswers,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      dateTime: dateTime ?? this.dateTime,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
    );
  }
}
