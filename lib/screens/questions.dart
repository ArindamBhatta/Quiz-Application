import 'package:flutter/material.dart';
import 'package:quiz_app/model/data_model.dart';
import '../data/all_questions.dart';
import '../widgets/option_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.tapToChoseAnswer,
  });

  final Function(String answer) tapToChoseAnswer;
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  void answerOnTap(String selectedAnswer) {
    print(selectedAnswer);
    widget.tapToChoseAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex = currentQuestionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final DataModel currentQuestionSet = questions[currentQuestionIndex];
    List<Widget> options = [];

    for (String option in currentQuestionSet.getShuffledOption()) {
      options.add(
        //* instantiate OptionButton
        OptionButton(
          optionText: option,
          userChosenAnswerTapped: () {
            answerOnTap(option);
          },
        ),
      );
    }
    print(options[0]);
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          children: [
            Text(
              currentQuestionSet.question, //* Question is decuple from options
              style: const TextStyle(
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            for (int i = 0; i < options.length; i++) options[i],
          ],
        ),
      ),
    );
  }
}
