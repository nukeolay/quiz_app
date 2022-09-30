import 'package:quiz_app/domain/entities/answer_entity.dart';
import 'package:quiz_app/domain/entities/category_entity.dart';
import 'package:quiz_app/domain/entities/difficulty_entity.dart';

class Question {
  final int id;
  final Category category;
  final String question;
  final Answers answers;
  final bool isMultipleCorrectAnswers;
  final Difficulty difficulty;

  const Question({
    required this.id,
    required this.category,
    required this.question,
    required this.answers,
    required this.isMultipleCorrectAnswers,
    required this.difficulty,
  });
}