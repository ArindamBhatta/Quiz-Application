import 'package:flutter/material.dart';
import '../data/all_questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.tapToReset,
    required this.viewUserAnswerList,
  });

  final void Function() tapToReset;
  final List<String> viewUserAnswerList;

  List<Map<String, Object>> actualResultPage() {
    final List<Map<String, Object>> summaryMaskSheet = [];
    for (int i = 0; i < viewUserAnswerList.length; i++) {
      summaryMaskSheet.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].option[0],
        'user_answer': viewUserAnswerList[i],
      });
    }
    return summaryMaskSheet;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> showUserAnswerUI = actualResultPage();
    final numberOfTotalQuestion = showUserAnswerUI.length;
    final correctAnswer = showUserAnswerUI.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          children: [
            Text(
              'You answered $correctAnswer out of $numberOfTotalQuestion questions correctly',
              style: const TextStyle(
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: tapToReset,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              label: const Text('Restart Quiz'),
              icon: const Icon(
                Icons.refresh,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
