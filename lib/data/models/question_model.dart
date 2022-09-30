import 'package:quiz_app/data/models/answer_model.dart';
import 'package:quiz_app/domain/entities/category_entity.dart';
import 'package:quiz_app/domain/entities/difficulty_entity.dart';
import 'package:quiz_app/domain/entities/question_entity.dart';

class QuestionModel extends Question {
  const QuestionModel({
    required super.id,
    required super.category,
    required super.question,
    required super.answers,
    required super.isMultipleCorrectAnswers,
    required super.difficulty,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    final Category category;
    switch (json['category'].toString().toLowerCase()) {
      case 'code':
        category = const Category(id: 0, title: 'Code');
        break;
      case 'devOps':
        category = const Category(id: 1, title: 'DevOps');
        break;
      case 'sql':
        category = const Category(id: 2, title: 'SQL');
        break;
      case 'cms':
        category = const Category(id: 3, title: 'CMS');
        break;
      case 'docker':
        category = const Category(id: 4, title: 'Docker');
        break;
      case 'linux':
        category = const Category(id: 5, title: 'Linux');
        break;
      default:
        category = const Category(id: 5, title: 'Linux');
    }

    final Difficulty difficulty;
    switch (json['difficulty'].toString().toLowerCase()) {
      case 'easy':
        difficulty = const Difficulty(id: 0, title: 'Easy');
        break;
      case 'medium':
        difficulty = const Difficulty(id: 1, title: 'Medium');
        break;
      case 'hard':
        difficulty = const Difficulty(id: 2, title: 'Hard');
        break;
      default:
        difficulty = const Difficulty(id: 1, title: 'Medium');
    }
    return QuestionModel(
      id: json['id'],
      category: category,
      question: json['question'],
      answers: AnswersModel.fromJsons(
        json['answers'] as Map<String, dynamic>,
        json['correct_answers'] as Map<String, dynamic>,
      ),
      isMultipleCorrectAnswers:
          json['multiple_correct_answers'] == 'true' ? true : false,
      difficulty: difficulty,
    );
  }

  @override
  String toString() {
    return 'id: $id, category: $category, question: $question, answers: $answers, isMultipleCorrectAnswers: $isMultipleCorrectAnswers, difficulty: $difficulty';
  }
}
