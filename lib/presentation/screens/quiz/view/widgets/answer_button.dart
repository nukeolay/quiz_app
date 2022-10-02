import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/presentation/routes/routes.dart';
import 'package:quiz_app/presentation/screens/quiz/view_model/quiz_view_model.dart';
import 'package:quiz_app/presentation/screens/score/view_model/score_view_model.dart';

class AnswerButton extends StatelessWidget {
  final int index;
  final String text;
  const AnswerButton({required this.index, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<QuizViewModel>();
    final state = viewModel.state;
    final isPressed = state.userAnswers[index];

    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade800),
        borderRadius: BorderRadius.circular(20),
        color: isPressed ? Colors.grey.shade800 : null,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            state.answers[index],
            style: const TextStyle(fontSize: 20),
          ),
        ),
        onTap: () {
          HapticFeedback.mediumImpact();
          viewModel.setUserAnswer(index);
          final hasNextQuestion = viewModel.hasNextQuestion;
          if (hasNextQuestion) {
            viewModel.nextQuestion();
            Navigator.of(context).pushReplacementNamed(Routes.quiz);
          } else {
            context.read<ScoreViewModel>().init();
            Navigator.of(context).pushReplacementNamed(Routes.score);
          }
        },
      ),
    );
  }
}
