import 'package:quiz_app/domain/entities/category_entity.dart';
import 'package:quiz_app/domain/entities/difficulty_entity.dart';
import 'package:quiz_app/domain/entities/question_entity.dart';

class Quiz {
  final Category category;
  final Difficulty difficulty;
  final List<Question> questions;
  final int currentQuestionIndex;
  final int score;

  Quiz({
    required this.category,
    required this.difficulty,
    required this.questions,
    required this.currentQuestionIndex,
    required this.score,
  });

  Quiz copyWith({
    Category? category,
    Difficulty? difficulty,
    List<Question>? questions,
    int? currentQuestionIndex,
    int? score,
  }) {
    return Quiz(
      category: category ?? this.category,
      difficulty: difficulty ?? this.difficulty,
      questions: questions ?? this.questions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      score: score ?? this.score,
    );
  }
}
