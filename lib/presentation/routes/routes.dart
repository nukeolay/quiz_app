import 'package:flutter/material.dart';
import 'package:quiz_app/presentation/screens/home/view/home_screen.dart';
import 'package:quiz_app/presentation/screens/quiz/view/quiz_screen.dart';
import 'package:quiz_app/presentation/screens/score/view/score_screen.dart';

class Routes {
  static const home = '/home-screen';
  static const quiz = '/quiz-screen';
  static const score = '/score-screen';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (context) {
        switch (routeSettings.name) {
          case home:
            return const HomeScreen();
          case quiz:
            return const QuizScreen();
          case score:
            return const ScoreScreen();
          default:
            return const HomeScreen();
        }
      },
    );
  }
}