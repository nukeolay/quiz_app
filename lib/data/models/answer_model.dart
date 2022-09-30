import 'package:quiz_app/domain/entities/answer_entity.dart';

class AnswerModel extends Answer {
  const AnswerModel({required super.text, required super.isCorrect});
}

class AnswersModel extends Answers {
  AnswersModel({required super.answers});

  factory AnswersModel.fromJsons(
    Map<String, dynamic> texts,
    Map<String, dynamic> isCorrects,
  ) {
    final answersText = texts.values.toList();
    final answersIsCorrect = isCorrects.values.toList();
    final List<AnswerModel> answers = [];
    for (var i = 0; i < answersText.length; i++) {
      if (answersText[i] == null) {
        continue;
      }
      answers.add(AnswerModel(
          text: answersText[i],
          isCorrect: answersIsCorrect[i] == 'true' ? true : false));
    }
    return AnswersModel(answers: answers);
  }
}
