import 'package:flutter/material.dart';
import '../widget/text.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(
    this.startQuiz, {
    super.key,
  });

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: width,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            ElevatedButton.icon(
              style: const ButtonStyle(
                  iconColor: MaterialStatePropertyAll(Colors.white),
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 189, 5, 51))),
              onPressed: startQuiz,
              label: const CustomText(text: 'Start Quiz'),
              icon: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
