import 'package:flutter/material.dart';
import 'package:quiz_app/domain/repositories/quiz_repository.dart';
import 'package:quiz_app/presentation/screens/quiz/view_model/quiz_view_model_state.dart';

class QuizViewModel extends ChangeNotifier {
  var _state = QuizViewModelState();
  final QuizRepository _quizRepository;

  QuizViewModelState get state => _state;

  QuizViewModel({required QuizRepository quizRepository})
      : _quizRepository = quizRepository {
    _init();
  }

  void _init() {
    final quiz = _quizRepository.quiz;
    final index = quiz.currentQuestionIndex;
    _state = _state.copyWith(
      difficulty: quiz.difficulty.title,
      category: quiz.category.title,
      question: quiz.questions[index].question,
      answers: quiz.questions[index].answers.answers
          .map((answer) => answer.text)
          .toList(),
      userAnswers: List<bool>.generate(
          quiz.questions[index].answers.answers.length, (index) => false),
      isMultipleCorrectAnswers: quiz.questions[index].isMultipleCorrectAnswers,
    );
    notifyListeners();
  }

  void setUserAnswer(int answerIndex) {
    final quiz = _quizRepository.quiz;
    final index = quiz.currentQuestionIndex;
    final updatedUserAnswers = List<bool>.generate(
        quiz.questions[index].answers.answers.length, (index) => false);
    updatedUserAnswers[answerIndex] = true;
    _state = _state.copyWith(userAnswers: updatedUserAnswers);
    notifyListeners();
  }

  bool nextQuestion() {
    final userAnswers = _state.userAnswers;
    final question = _quizRepository.nextQuestion(userAnswers);
    if (question != null) {
      final quiz = _quizRepository.quiz;
      final index = quiz.currentQuestionIndex;
      _state = _state.copyWith(
        difficulty: quiz.difficulty.title,
        category: quiz.category.title,
        question: quiz.questions[index].question,
        answers: quiz.questions[index].answers.answers
            .map((answer) => answer.text)
            .toList(),
        userAnswers: List<bool>.generate(
            quiz.questions[index].answers.answers.length, (index) => false),
        isMultipleCorrectAnswers:
            quiz.questions[index].isMultipleCorrectAnswers,
      );
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }
}
