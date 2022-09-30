import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_app/common/exceptions.dart';
import 'package:quiz_app/data/models/question_model.dart';
import 'package:quiz_app/domain/entities/category_entity.dart';
import 'package:quiz_app/domain/entities/difficulty_entity.dart';

abstract class QuestionDataSource {
  Future<List<QuestionModel>> getQuestions({
    required String category,
    required String difficulty,
  });
  List<Category> getCategories();
  List<Difficulty> getDifficulties();
}

class QuestionDataSourceImpl implements QuestionDataSource {
  const QuestionDataSourceImpl();

  @override
  Future<List<QuestionModel>> getQuestions(
      {required String category, required String difficulty}) async {
    final uri = Uri(
      scheme: 'https',
      host: 'quizapi.io',
      path: 'api/v1/questions',
      queryParameters: {
        'apiKey': 'j24WhINsXuMG7PszLmbkLHqRiXRoFnjRZrHxkwDa',
        'category': category,
        'difficulty': difficulty,
      },
    );

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return (jsonDecode(response.body) as List)
            .map((question) => QuestionModel.fromJson(question))
            .toList();
      } else {
        throw ServerException();
      }
    } catch (error) {
      throw ServerException();
    }
  }

  @override
  List<Category> getCategories() {
    return [
      const Category(id: 0, title: 'Code'),
      const Category(id: 1, title: 'DevOps'),
      const Category(id: 2, title: 'SQL'),
      const Category(id: 3, title: 'CMS'),
      const Category(id: 4, title: 'Docker'),
      const Category(id: 5, title: 'Linux'),
    ];
  }

  @override
  List<Difficulty> getDifficulties() {
    return [
      const Difficulty(id: 0, title: 'Easy'),
      const Difficulty(id: 1, title: 'Medium'),
      const Difficulty(id: 2, title: 'Hard'),
    ];
  }
}
