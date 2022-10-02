import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/data/datasources/question_datasource.dart';
import 'package:quiz_app/data/datasources/score_storage.dart';
import 'package:quiz_app/data/repositories/questions_repository_impl.dart';
import 'package:quiz_app/data/repositories/score_repository_impl.dart';
import 'package:quiz_app/domain/repositories/questions_repository.dart';
import 'package:quiz_app/domain/repositories/quiz_repository.dart';
import 'package:quiz_app/domain/repositories/score_repository.dart';
import 'package:quiz_app/presentation/routes/custom_page_transition_builder.dart';
import 'package:quiz_app/presentation/routes/routes.dart';
import 'package:quiz_app/presentation/screens/home/view/home_screen.dart';
import 'package:quiz_app/presentation/screens/home/view_model/home_view_model.dart';
import 'package:quiz_app/presentation/screens/quiz/view_model/quiz_view_model.dart';
import 'package:quiz_app/presentation/screens/score/view_model/score_view_model.dart';

void main() {
  const questionDatasource = QuestionDataSourceImpl();
  const scoreStorage = ScoreStorageImpl();
  const QuestionsRepository questionsRepository =
      QuestionsRepositoryImpl(questionDataSource: questionDatasource);
  QuizRepository quizRepository = QuizRepositoryImpl();
  ScoreRepository scoreRepository =
      const ScoreRepositoryImpl(scoreStorage: scoreStorage);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => HomeViewModel(
        questionsRepository: questionsRepository,
        quizRepository: quizRepository,
      ),
    ),
    ChangeNotifierProvider(
      create: (_) => QuizViewModel(
        quizRepository: quizRepository,
      ),
    ),
    ChangeNotifierProvider(
      create: (_) => ScoreViewModel(
        scoreRepository: scoreRepository,
        quizRepository: quizRepository,
      ),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CustomPageTransitionBuilder(),
          TargetPlatform.iOS: CustomPageTransitionBuilder(),
        }),
      ),
      home: const HomeScreen(),
      onGenerateRoute: Routes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
