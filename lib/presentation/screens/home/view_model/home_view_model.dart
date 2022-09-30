import 'package:flutter/material.dart';
import 'package:quiz_app/domain/entities/quiz_entity.dart';
import 'package:quiz_app/domain/repositories/questions_repository.dart';
import 'package:quiz_app/domain/repositories/quiz_repository.dart';
import 'package:quiz_app/presentation/screens/home/view_model/home_view_model_state.dart';

class HomeViewModel extends ChangeNotifier {
  var _state = HomeViewModelState();
  final QuestionsRepository _questionsRepository;
  final QuizRepository _quizRepository;

  HomeViewModelState get state => _state;

  HomeViewModel({
    required QuestionsRepository questionsRepository,
    required QuizRepository quizRepository,
  })  : _questionsRepository = questionsRepository,
        _quizRepository = quizRepository {
    _init();
  }

  void _init() {
    _state = _state.copyWith(
      categories: _questionsRepository.fetchCategories(),
      difficulties: _questionsRepository.fetchDifficulties(),
    );
    notifyListeners();
  }

  void changeCategory(int categoryId) {
    _state = _state.copyWith(selectedCategoryId: categoryId);
    notifyListeners();
  }

  void changeDifficulty(int difficultyId) {
    _state = _state.copyWith(selectedDifficultyId: difficultyId);
    notifyListeners();
  }

  Future<void> start() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
    final category = state.categories[state.selectedCategoryId];
    final difficulty = state.difficulties[state.selectedDifficultyId];
    final questions = await _questionsRepository.fetchQuestions(
      category: category,
      difficulty: difficulty,
    );
    _state = _state.copyWith(isLoading: false);
    notifyListeners();
    _quizRepository.setQuiz(
      Quiz(
        category: category,
        difficulty: difficulty,
        questions: questions,
        currentQuestionIndex: 0,
        score: 0,
      ),
    );
  }

  void showError() {
    _state = _state.copyWith(isError: true);
    notifyListeners();
    Future.delayed(const Duration(seconds: 1)).then((_) {
      _state = _state.copyWith(isLoading: false, isError: false);
      notifyListeners();
    });
  }
}
