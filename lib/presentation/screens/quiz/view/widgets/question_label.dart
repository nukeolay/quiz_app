import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/presentation/screens/quiz/view_model/quiz_view_model.dart';

class QuestionLabel extends StatelessWidget {
  const QuestionLabel({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<QuizViewModel>();
    final state = viewModel.state;
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        state.question,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
