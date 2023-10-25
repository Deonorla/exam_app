import 'package:cbt_mobile_application/controllers/question_paper/question_controller.dart';
import 'package:get/get.dart';

extension QuestionControllerExtension on QuestionController {
  int get correctQuestionCount => allQuestions
      .where((element) => element.selectedAnswer == element.correctAnswer)
      .toList()
      .length;

  String get correctAnsweredQuestions {
    return '$correctQuestionCount out of ${allQuestions.length} are correct ';
  }

  int get score {
    var score = correctQuestionCount;
    return score;
  }

  // int get progress {

  // }
}
