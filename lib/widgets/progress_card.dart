import 'package:cbt_mobile_application/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressCard extends StatelessWidget {
  final int examCount;

  ProgressCard({Key? key, required this.examCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromRGBO(0, 0, 0, 0.46),
            Color.fromRGBO(0, 0, 0, 0.83),
          ],
        ),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Exam Progress",
                      style: TextStyle(
                        color: darkColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Total Exams:  $examCount",
                      style: const TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Completed:  0",
                      style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              CircularPercentIndicator(
                radius: 50,
                lineWidth: 3,
                percent: 0.10,
                center: const Text(
                  '0%',
                  style: TextStyle(color: whiteColor),
                ),
                progressColor: Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
