import 'package:flutter/material.dart';
import 'package:quiz_app/model/questions_dummy.dart';
import 'package:quiz_app/screens/result_screen/question_summary.dart';
import 'package:quiz_app/utils/colors.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.chosenAnswer, {super.key, required this.restart});
  final List<String> chosenAnswer;
  final void Function()? restart;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summaryData = [];
    for (int i = 0; i < chosenAnswer.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answer[0],
        'user_answer': chosenAnswer[i],
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final summaryData = getSummaryData();
    final totalNumQuestions = questions.length;
    final totalCorrectQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You answered $totalCorrectQuestions out of $totalNumQuestions questions correctly',
            style: TextStyle(color: primary, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height * 0.06,
          ),
          QuestionsSummary(summaryData),
          SizedBox(
            height: height * 0.06,
          ),
          ElevatedButton.icon(
            onPressed: restart,
            icon: Icon(Icons.restart_alt),
            label: Text('Restart'),
          )
        ],
      ),
    );
  }
}
