import 'package:quiz_app/data/datasources/score_storage.dart';
import 'package:quiz_app/domain/repositories/score_repository.dart';

class ScoreRepositoryImpl implements ScoreRepository {
  final ScoreStorage scoreStorage;

  const ScoreRepositoryImpl({required this.scoreStorage});
  @override
  Future<bool> saveScore({
    required DateTime date,
    required String category,
    required String difficulty,
    required int correctAnswers,
    required int wrongAnswers,
  }) {
    return scoreStorage.saveScore(
      date: date,
      category: category,
      difficulty: difficulty,
      correctAnswers: correctAnswers,
      wrongAnswers: wrongAnswers,
    );
  }
}
