import 'package:cbt_mobile_application/controllers/my_app_life_cycle_observer.dart';
import 'package:cbt_mobile_application/controllers/question_paper/question_controller.dart';
import 'package:cbt_mobile_application/controllers/question_paper/question_controller_extension.dart';
import 'package:cbt_mobile_application/screens/view/answer_check_screen.dart';
import 'package:cbt_mobile_application/widgets/common/custom_app_bar.dart';
import 'package:cbt_mobile_application/widgets/questions/answer_card.dart';
import 'package:cbt_mobile_application/widgets/questions/question_number_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/main_button.dart';
import '../home/home_screen.dart';

class ResultScreen extends GetView<QuestionController> {
  final MyAppLifecycleObserver lifecycleObserver;
  const ResultScreen({super.key, required this.lifecycleObserver});

  void _navigateToHomePage() {
    Get.offAll(() => const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          lifecycleObserver: lifecycleObserver,
          leading: const SizedBox(
            height: 80,
          ),
          title: "Success",
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Expanded(
                  child: SafeArea(
                      child: Column(
                children: [
                  Image.asset(
                    "assets/images/splash_images/books-pile.png",
                    height: 200,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Examination submitted",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // Expanded(
                  //     child: GridView.builder(
                  //         itemCount: controller.allQuestions.length,
                  //         shrinkWrap: true,
                  //         physics: const BouncingScrollPhysics(),
                  //         gridDelegate:
                  //             SliverGridDelegateWithFixedCrossAxisCount(
                  //           crossAxisCount: Get.width ~/ 75,
                  //           childAspectRatio: 1,
                  //           crossAxisSpacing: 8,
                  //           mainAxisSpacing: 8,
                  //         ),
                  //         itemBuilder: (_, index) {
                  //           final _question = controller.allQuestions[index];
                  //           AnswerStatus _status = AnswerStatus.notanswered;
                  //           final _selectedAnswer = _question.selectedAnswer;
                  //           final _correctAnswer = _question.correctAnswer;
                  //           if (_selectedAnswer == _correctAnswer) {
                  //             _status = AnswerStatus.correct;
                  //           } else if (_question.selectedAnswer == null) {
                  //             _status = AnswerStatus.wrong;
                  //           } else {
                  //             _status = AnswerStatus.wrong;
                  //           }
                  //           return QuestionNumberCard(
                  //               index: index,
                  //               status: _status,
                  //               onTap: () {
                  //                 controller.jumpToQuestion(index,
                  //                     isGoBack: false);
                  //                 Get.put(QuestionController(
                  //                     lifecycleObserver: lifecycleObserver));
                  //                 Get.to(() => AnswerCheckScreen(
                  //                     lifecycleObserver: lifecycleObserver));
                  //               });
                  //         }))
                ],
              ))),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: ColoredBox(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: MainButton(
                      onTap: () {
                        // Delay the navigation until the build is complete
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _navigateToHomePage();
                        });
                      },
                      title: 'Go to homepage',
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
