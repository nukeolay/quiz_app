import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:quiz_app/common/exceptions.dart';

abstract class ScoreStorage {
  Future<bool> saveScore({
    required DateTime date,
    required String category,
    required String difficulty,
    required int correctAnswers,
    required int wrongAnswers,
  });
}

class ScoreStorageImpl implements ScoreStorage {
  const ScoreStorageImpl();

  @override
  Future<bool> saveScore({
    required DateTime date,
    required String category,
    required String difficulty,
    required int correctAnswers,
    required int wrongAnswers,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: 'quizapp-cc0b6-default-rtdb.firebaseio.com',
      path: 'scores.json',
    );

    try {
      final response = await http.post(uri,
          body: jsonEncode({
            'date': date.toString(),
            'category': category,
            'difficulty': difficulty,
            'correctAnswers': correctAnswers,
            'wrongAnswers': wrongAnswers,
          }));
      if (response.statusCode == 200) {
        return true;
      } else {
        throw ServerException();
      }
    } catch (error) {
      throw ServerException();
    }
  }
}
