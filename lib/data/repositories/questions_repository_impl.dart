import 'package:quiz_app/data/datasources/question_datasource.dart';
import 'package:quiz_app/domain/entities/category_entity.dart';
import 'package:quiz_app/domain/entities/difficulty_entity.dart';
import 'package:quiz_app/domain/entities/question_entity.dart';
import 'package:quiz_app/domain/repositories/questions_repository.dart';

class QuestionsRepositoryImpl implements QuestionsRepository {
  final QuestionDataSource questionDataSource;

  const QuestionsRepositoryImpl({required this.questionDataSource});

  @override
  Future<List<Question>> fetchQuestions({
    required Category category,
    required Difficulty difficulty,
  }) async {
    return await questionDataSource.getQuestions(
      category: category.title,
      difficulty: difficulty.title,
    );
  }

  @override
  List<Category> fetchCategories() {
    return questionDataSource.getCategories();
  }

  @override
  List<Difficulty> fetchDifficulties() {
    return questionDataSource.getDifficulties();
  }
}
