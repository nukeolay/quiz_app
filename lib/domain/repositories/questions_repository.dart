import 'package:quiz_app/domain/entities/category_entity.dart';
import 'package:quiz_app/domain/entities/difficulty_entity.dart';
import 'package:quiz_app/domain/entities/question_entity.dart';

abstract class QuestionsRepository {
  Future<List<Question>> fetchQuestions({
    required Category category,
    required Difficulty difficulty,
  });
  List<Category> fetchCategories();
  List<Difficulty> fetchDifficulties();
}
