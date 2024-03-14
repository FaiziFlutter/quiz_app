import 'package:flutter/material.dart';
import 'package:quiz_app/model/questions_dummy.dart';
import 'package:quiz_app/widget/button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionindex = 0;
  void answerQuestion() {
    setState(() {
      currentQuestionindex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionindex];

    return Scaffold(
        body: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.question,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          ...currentQuestion.getShuffledAnswer().map((e) {
            return CustomElevatedButton(onPressed: answerQuestion, text: e);
          })
        ],
      ),
    ));
  }
}
