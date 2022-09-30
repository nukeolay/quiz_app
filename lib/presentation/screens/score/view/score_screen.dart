import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/presentation/common/error_message.dart';
import 'package:quiz_app/presentation/routes/routes.dart';
import 'package:quiz_app/presentation/screens/score/view/widgets/result_text.dart';
import 'package:quiz_app/presentation/screens/score/view/widgets/score_saved_message.dart';
import 'package:quiz_app/presentation/screens/score/view_model/score_view_model.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ScoreViewModel>();
    final state = viewModel.state;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Quiz is finished!',
                    style: TextStyle(fontSize: 50),
                    textAlign: TextAlign.center,
                  ),
                ),
                ResultText(
                  title: 'Correct answers',
                  value: state.correctAnswers.toString(),
                ),
                ResultText(
                  title: 'Wrong answers',
                  value: state.wrongAnswers.toString(),
                ),
                ResultText(
                  title: 'Category',
                  value: state.category.toString(),
                ),
                ResultText(
                  title: 'Difficulty',
                  value: state.difficulty.toString(),
                ),
                ResultText(
                  title: 'Completed on',
                  value: DateFormat('dd-MM-yyyy H:mm')
                      .format(
                          DateTime.fromMillisecondsSinceEpoch(state.dateTime))
                      .toString(),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      viewModel
                          .saveScore()
                          // .then((_) {
                          //   context.read<QuizViewModel>().clear();
                          // })
                          .then((_) => Navigator.of(context)
                              .pushReplacementNamed(Routes.home))
                          .onError(
                            (_, __) => viewModel.showError(),
                          );
                    },
                    child: const Text('SAVE SCORE'),
                  ),
                ),
              ],
            ),
            if (state.isLoading && !state.isError)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (state.isError) const ErrorMessage(),
            if (state.isScoreSaved) const ScoreSavedMessage(),
          ],
        ),
      ),
    );
  }
}
