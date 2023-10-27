import 'package:cbt_mobile_application/controllers/auth/auth_controller.dart';
import 'package:cbt_mobile_application/controllers/profileController.dart';
import 'package:cbt_mobile_application/controllers/question_paper/question_controller.dart';
import 'package:cbt_mobile_application/firebase_ref/references.dart';
import 'package:cbt_mobile_application/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension QuestionControllerExtension on QuestionController {
  static final profController = Get.put(ProfileController());
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

  Future<void> saveResult() async {
    var batch = fireStore.batch();
    User? _user = Get.find<AuthController>().getUser();
    if (_user == null) return;

    UserModel userData = await profController.getUserData();

    try {
      batch.set(
          resultRf
              .doc(_user.email)
              .collection('exam_results')
              .doc(questionPaperModel.title),
          {
            "Matric Number": userData.matricNo,
            "Full Name": userData.fullName,
            "Course": questionPaperModel.title,
            "Score": score,
            "Question_id": questionPaperModel.id,
            "Email": userData.email,
          });
      await batch.commit();
    } catch (e) {
      print(e);
    }
  }
}
