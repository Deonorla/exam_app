import 'package:cbt_mobile_application/screens/view/exam_overview_screen.dart';
import 'package:cbt_mobile_application/widgets/common/custom_app_bar.dart';
import 'package:cbt_mobile_application/widgets/main_button.dart';
import 'package:cbt_mobile_application/widgets/questions/countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cbt_mobile_application/controllers/question_paper/question_controller.dart';
import 'package:cbt_mobile_application/controllers/my_app_life_cycle_observer.dart';

void main() {
  testWidgets('ExamOverviewScreen widget test', (WidgetTester tester) async {
    // Mock data for testing
    final navigatorKey = GlobalKey<NavigatorState>();
    final MyAppLifecycleObserver mockLifecycleObserver =
        MyAppLifecycleObserver(navigatorKey);

    final QuestionController mockController =
        QuestionController(lifecycleObserver: mockLifecycleObserver);

    await tester.pumpWidget(
      MaterialApp(
        home: ExamOverviewScreen(
          lifecycleObserver: mockLifecycleObserver,
        ),
      ),
    );

    // Verify that key UI components are present
    expect(find.byType(CustomAppBar), findsOneWidget);
    expect(find.byType(CountdownTimer), findsOneWidget);
    expect(find.byType(MainButton), findsOneWidget);

    // You can perform additional checks based on your widget structure and logic.

    // To test the _submitExam method, you can simulate a tap on the MainButton widget.
    await tester.tap(find.byType(MainButton));
    await tester.pump();
  });
}
