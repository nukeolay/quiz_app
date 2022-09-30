import 'package:flutter/material.dart';
import 'package:quiz_app/common/exceptions.dart';
import 'package:quiz_app/domain/repositories/quiz_repository.dart';
import 'package:quiz_app/domain/repositories/score_repository.dart';
import 'package:quiz_app/presentation/screens/score/view_model/score_view_model_state.dart';

class ScoreViewModel extends ChangeNotifier {
  var _state = ScoreViewModelState();
  final ScoreRepository _scoreRepository;
  final QuizRepository _quizRepository;

  ScoreViewModelState get state => _state;

  ScoreViewModel(
      {required ScoreRepository scoreRepository,
      required QuizRepository quizRepository})
      : _scoreRepository = scoreRepository,
        _quizRepository = quizRepository {
    _init();
  }

  void _init() {
    final quiz = _quizRepository.quiz;
    _state = _state.copyWith(
      difficulty: quiz.difficulty.title,
      category: quiz.category.title,
      wrongAnswers: quiz.questions.length - quiz.score,
      correctAnswers: quiz.score,
      dateTime: DateTime.now().millisecondsSinceEpoch,
    );
    notifyListeners();
  }

  Future<void> saveScore() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
    try {
      final result = await _scoreRepository.saveScore(
        category: state.category,
        difficulty: state.difficulty,
        date: DateTime.fromMillisecondsSinceEpoch(state.dateTime),
        correctAnswers: state.correctAnswers,
        wrongAnswers: state.wrongAnswers,
      );
    } catch (error) {
      throw ServerException();
    }
    // if (!result) {
    //   _state = _state.copyWith(isError: true, isLoading: false);
    // }
    notifyListeners();
    Future.delayed(const Duration(seconds: 1)).then((_) {
      _state = _state.copyWith(isLoading: false, isError: false);
      notifyListeners();
    });
  }
}
