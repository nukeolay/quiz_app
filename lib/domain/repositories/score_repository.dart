abstract class ScoreRepository {
  Future<void> saveScore({
    required DateTime date,
    required String category,
    required String difficulty,
    required int correctAnswers,
    required int wrongAnswers,
  });
}
