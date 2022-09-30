import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/presentation/screens/quiz/view/widgets/answer_button.dart';
import 'package:quiz_app/presentation/screens/quiz/view/widgets/question_label.dart';
import 'package:quiz_app/presentation/screens/quiz/view_model/quiz_view_model.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<QuizViewModel>();
    final state = viewModel.state;
    final answers = state.answers;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(state.category),
            Text(state.difficulty),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const QuestionLabel(),
            ...answers
                .map((answer) =>
                    AnswerButton(index: answers.indexOf(answer), text: answer))
                .toList(),
          ],
        ),
      ),
    );
  }
}
