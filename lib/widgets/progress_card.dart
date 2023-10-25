import 'package:cbt_mobile_application/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressCard extends StatelessWidget {
  final int examCount;
  const ProgressCard({super.key, required this.examCount});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      // width: Get.width / .8,
      // height: Get.height / 6,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromRGBO(0, 0, 0, 0.46),
                Color.fromRGBO(0, 0, 0, 0.83)
              ]),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Exam Progress",
                  style: TextStyle(
                      color: darkColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 26),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Total Exams:  $examCount",
                  style: const TextStyle(
                      color: whiteColor, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Completed:  0",
                  style:
                      TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Expanded(
              child: CircularPercentIndicator(
                radius: 50,
                lineWidth: 3,
                percent: .90,
                center: const Text(
                  '0%',
                  style: TextStyle(color: whiteColor),
                ),
                progressColor: Colors.green,
              ),
            )
          ],
        )
      ]),
    );
  }
}
