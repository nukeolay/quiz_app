import 'package:quiz_app/domain/entities/question_entity.dart';
import 'package:quiz_app/domain/entities/quiz_entity.dart';

abstract class QuizRepository {
  void setQuiz(Quiz quiz);
  Quiz get quiz;
  Question? nextQuestion(List<bool> userAnswers);
}

class QuizRepositoryImpl implements QuizRepository {
  late Quiz _quiz;

  QuizRepositoryImpl();

  @override
  Quiz get quiz => _quiz;

  @override
  void setQuiz(Quiz quiz) {
    _quiz = quiz;
  }

  @override
  Question? nextQuestion(List<bool> userAnswers) {
    int score = 1;
    final currentIndex = _quiz.currentQuestionIndex;
    final currentQuestion = _quiz.questions[currentIndex];
    final answers = currentQuestion.answers;
    for (int i = 0; i < userAnswers.length; i++) {
      if (userAnswers[i] != answers.answers[i].isCorrect) {
        score = 0;
        break;
      }
    }
    _quiz = _quiz.copyWith(score: _quiz.score + score);
    if (currentIndex < _quiz.questions.length - 1) {
      _quiz = _quiz.copyWith(currentQuestionIndex: currentIndex + 1);
      return _quiz.questions[_quiz.currentQuestionIndex];
    }
    return null;
  }
}
