import 'package:flutter/material.dart';
import 'package:quiz_app/utils/colors.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.5,
      color: green,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map(
              (data) {
                return SizedBox(
                  height: height * 0.12,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width * 0.03,
                      ),
                      CircleAvatar(
                          backgroundColor:
                              data['user_answer'] == data['correct_answer']
                                  ? blue
                                  : red,
                          radius: height * 0.018,
                          child: Text(
                            ((data['question_index'] as int) + 1).toString(),
                          )),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['question'].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              data['user_answer'].toString(),
                              style: TextStyle(
                                  color: grey, fontSize: width * 0.03),
                            ),
                            Text(
                              data['correct_answer'].toString(),
                              style: TextStyle(
                                  color: blue, fontSize: width * 0.03),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
