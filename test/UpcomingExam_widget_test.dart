import 'package:cbt_mobile_application/screens/home/upcoming_exam_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cbt_mobile_application/models/question_paper_model.dart';

void main() {
  testWidgets('UpcomingExamCard widget test', (WidgetTester tester) async {
    // Mock data for testing
    test('QuestionPaperModel.fromJson should create a valid model', () async {
      final Map<String, dynamic> json = {
        'id': '1',
        'title': 'Sample Title',
        'image_url': 'sample_image_url',
        'description': 'Sample Description',
        'time_seconds': 120,
        'questions': [
          {
            'id': 'q1',
            'question': 'Sample Question',
            'answers': [
              {'identifier': 'a', 'Answer': 'Option A'},
              {'identifier': 'b', 'Answer': 'Option B'},
            ],
            'correct_answer': 'a',
          }
        ],
      };
      final QuestionPaperModel model = QuestionPaperModel.fromJson(json);

      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: UpcomingExamCard(model: model),
        ),
      );

      // Verify that the key UI components are present based on the provided data.
      expect(model.id, '1');
      expect(model.title, 'Sample Title');
      expect(model.imageUrl, 'sample_image_url');
      expect(model.description, 'Sample Description');
      expect(model.timeSeconds, 120);
      expect(model.questionCount,
          0); // Since 'questions_count' is not provided in the JSON
      expect(model.questions!.length, 1);

      final Questions question = model.questions![0];
      expect(question.id, 'q1');
      expect(question.question, 'Sample Question');
      expect(question.answers.length, 2);

      final Answers answerA = question.answers[0];
      expect(answerA.identifier, 'a');
      expect(answerA.answer, 'Option A');
      expect(question.correctAnswer, 'a');
    });

    // To test the onTap functionality, you can simulate a tap and check the expected behavior.
    await tester.tap(find.byType(InkWell));
    await tester.pump();
  });
}
