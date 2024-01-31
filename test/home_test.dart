import 'package:cbt_mobile_application/controllers/question_paper/question_paper_controller.dart';
import 'package:cbt_mobile_application/screens/home/Home.dart';
import 'package:cbt_mobile_application/screens/home/upcoming_exam_card.dart';
import 'package:cbt_mobile_application/widgets/progress_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('Home widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: Home(),
      ),
    );

    // Verify that the ProgressCard widget is present.
    expect(find.byType(ProgressCard), findsOneWidget);

    // Verify that the "Today" text is present.
    expect(find.text("Today"), findsOneWidget);

    // Verify that the CircularProgressIndicator is initially displayed.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Simulate loading data by providing a non-empty list of papers.
    Get.put(QuestionPaperController());
    final controller = Get.find<QuestionPaperController>();
    controller.allPapers.assignAll([/* Mock data for testing */]);

    // Trigger a frame to rebuild the widget with the loaded data.
    await tester.pump();

    // Verify that the CircularProgressIndicator is no longer displayed.
    expect(find.byType(CircularProgressIndicator), findsNothing);

    // Verify that UpcomingExamCard widgets are present based on the loaded data.
    expect(find.byType(UpcomingExamCard), findsWidgets);

    // You can perform additional checks based on your widget structure and logic.
  });
}
