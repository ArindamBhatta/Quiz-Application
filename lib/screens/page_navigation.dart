import 'package:flutter/material.dart%20';
import 'package:quiz_app/widgets/home.dart';
import 'package:quiz_app/screens/questions.dart';
import '../data/all_questions.dart';
import '../widgets/result.dart';

class PageNavigation extends StatefulWidget {
  const PageNavigation({super.key});

  @override
  State<PageNavigation> createState() {
    return _PageUiState();
  }
}

class _PageUiState extends State<PageNavigation> {
  List<String> allUserSelectedAnswer = [];
  String activeScreen = "home-screen";

  void nextScreen() {
    setState(() {
      allUserSelectedAnswer = [];
      activeScreen = "question-screen";
    });
  }

  void userChosenAnswer(String selectedAnswer) {
    allUserSelectedAnswer.add(selectedAnswer);
    if (allUserSelectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      allUserSelectedAnswer = [];
      activeScreen = "Question-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget switchScreen = HomeScreen(
      tapToChangeScreen: nextScreen,
    );

    if (activeScreen == "question-screen") {
      switchScreen = QuestionsScreen(
        tapToChoseAnswer: userChosenAnswer,
      );
    }

    if (activeScreen == "result-screen") {
      switchScreen = ResultScreen(
        viewUserAnswerList: allUserSelectedAnswer,
        tapToReset: restartQuiz,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: switchScreen,
      ),
    );
  }
}
