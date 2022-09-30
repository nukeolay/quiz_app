abstract class ScoreRepository {
  Future<bool> saveScore({
    required DateTime date,
    required String category,
    required String difficulty,
    required int correctAnswers,
    required int wrongAnswers,
  });
}
