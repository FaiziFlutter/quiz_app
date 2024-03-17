import 'package:flutter/material.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    var screenWidget = activeScreen == 'start_screen'
        ? StartScreen(switchScreen)
        : QuestionScreen(
            onSelectedAnswers: (answers) {
              chosenAnswer(answers);
            },
          );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 189, 5, 51)),
        useMaterial3: true,
      ),
      home: screenWidget,
    );
  }
}
