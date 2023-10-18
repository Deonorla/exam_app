import 'package:cbt_mobile_application/configs/themes/custom_text_style.dart';
import 'package:cbt_mobile_application/controllers/question_paper/question_controller.dart';
import 'package:cbt_mobile_application/firebase_ref/loading_status.dart';
import 'package:cbt_mobile_application/screens/view/exam_overview_screen.dart';
import 'package:cbt_mobile_application/widgets/common/custom_app_bar.dart';
import 'package:cbt_mobile_application/widgets/main_button.dart';
import 'package:cbt_mobile_application/widgets/questions/answer_card.dart';
import 'package:cbt_mobile_application/widgets/questions/countdown_timer.dart';
import 'package:cbt_mobile_application/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/my_app_life_cycle_observer.dart';
import '../../services/local_auth_service.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen>
    with WidgetsBindingObserver {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  late MyAppLifecycleObserver lifecycleObserver;

  @override
  void initState() {
    super.initState();
    lifecycleObserver = MyAppLifecycleObserver(navigatorKey);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put<QuestionController>(QuestionController());
    final controller = Get.find<QuestionController>();
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: CustomAppBar(
              leading: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: const ShapeDecoration(
                      shape: StadiumBorder(
                          side: BorderSide(color: Colors.black, width: 1))),
                  child: Obx(() => CountdownTimer(
                        time: controller.time.value,
                        color: Colors.black,
                      ))),
              showActionIcon: true,
              titleWidget: Obx(
                () => Text(
                  "Q . ${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}",
                  style: AppBarTS,
                ),
              )),
          body: Obx(() => Column(children: [
                if (controller.loadingStatus.value == LoadingStatus.loading)
                  const Expanded(
                      child: SafeArea(child: QuestionScreenHolder())),
                if (controller.loadingStatus.value == LoadingStatus.completed)
                  Expanded(
                    child: SafeArea(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(
                          right: 20,
                          left: 20,
                          top: 35,
                        ),
                        child: Column(
                          children: [
                            Text(
                              controller.currentQuestion.value!.question,
                              style: questionTs,
                            ),
                            GetBuilder<QuestionController>(
                                id: 'answers_list',
                                builder: (context) {
                                  return ListView.separated(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.only(top: 25),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final answer = controller.currentQuestion
                                          .value!.answers[index];
                                      return AnswerCard(
                                        answer:
                                            '${answer.identifier}. ${answer.answer}',
                                        onTap: () {
                                          controller.selectedAnswer(
                                              answer.identifier);
                                        },
                                        isSelected: answer.identifier ==
                                            controller.currentQuestion.value!
                                                .selectedAnswer,
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            const SizedBox(height: 10),
                                    itemCount: controller
                                        .currentQuestion.value!.answers.length,
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ColoredBox(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 24),
                    child: Row(children: [
                      Visibility(
                        visible: controller.isFirstQuestion,
                        child: SizedBox(
                            width: 55,
                            height: 55,
                            child: MainButton(
                              onTap: () {
                                controller.prevQuestion();
                              },
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: Theme.of(context).primaryColor,
                              ),
                            )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Visibility(
                            visible: controller.loadingStatus.value ==
                                LoadingStatus.completed,
                            child: MainButton(
                              onTap: () async {
                                final auth = await LocalAuth.authenticate();
                                if (auth) {
                                  controller.isLastQuestion
                                      ? Get.to(() => const ExamOverviewScreen())
                                      : controller.nextquestion();
                                } else {
                                  return;
                                }
                              },
                              title: controller.isLastQuestion
                                  ? 'Complete'
                                  : 'Next',
                            )),
                      )
                    ]),
                  ),
                ),
                const SizedBox(height: 10),
              ])),
        ));
  }
}
