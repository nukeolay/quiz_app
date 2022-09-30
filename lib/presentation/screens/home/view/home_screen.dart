import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/presentation/routes/routes.dart';
import 'package:quiz_app/presentation/screens/home/view/widgets/category_drop_down.dart';
import 'package:quiz_app/presentation/screens/home/view/widgets/difficulty_drop_down.dart';
import 'package:quiz_app/presentation/common/error_message.dart';
import 'package:quiz_app/presentation/screens/home/view_model/home_view_model.dart';
import 'package:quiz_app/presentation/screens/quiz/view_model/quiz_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    final state = viewModel.state;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Quiz App', style: TextStyle(fontSize: 50)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        'please choose category\nand difficulty level',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          CategoryDropDown(),
                          DifficultyDropDown(),
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    viewModel
                        .start()
                        .then((_) {
                          context.read<QuizViewModel>().init();
                        })
                        .then((_) => Navigator.of(context)
                            .pushReplacementNamed(Routes.quiz))
                        .onError(
                          (_, __) => viewModel.showError(),
                        );
                  },
                  child: const Text('START'),
                ),
              ],
            ),
            if (state.isLoading && !state.isError)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (state.isError) const ErrorMessage(),
          ],
        ),
      ),
    );
  }
}
