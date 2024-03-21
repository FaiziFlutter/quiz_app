import 'package:flutter/material.dart';
import 'package:quiz_app/model/questions_dummy.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/result_screen/result_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';
import 'package:quiz_app/utils/colors.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  dynamic activeScreen = 'start_screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question_screen';
    });
  }

  void chosenAnswer(answers) {
    selectedAnswer.add(answers);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result_screen';
      });
    }
  }

  void restart() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'question_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    dynamic screenWidget = activeScreen == 'start_screen'
        ? StartScreen(switchScreen)
        : QuestionScreen(
            onSelectedAnswers: (answers) {
              chosenAnswer(answers);
            },
          );
    if (activeScreen == 'result_screen') {
      screenWidget = ResultScreen(
        selectedAnswer,
        restart: restart,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        useMaterial3: true,
      ),
      home: screenWidget,
    );
  }
}
