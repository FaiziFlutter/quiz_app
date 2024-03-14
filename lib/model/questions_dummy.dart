import 'package:quiz_app/model/questions_model.dart';

const questions = [
  QuizQuestion('What is Flutter?', [
    'Flutter is an open-source backend development framework',
    'Flutter is an open-source UI toolkit',
    'Flutter is an open-source programming language for cross-platform applications',
    'Flutters is a DBMS toolkit'
  ]),
  QuizQuestion(
      'Who developed the Flutter Framework and continues to maintain it today?',
      ['Facebook', 'Microsoft', 'Google', 'Oracle']),
  QuizQuestion(
      'Which programming language is used to build Flutter applications?',
      ['Kotlin', 'Dart', 'Java', 'Go']),
  QuizQuestion(
      'How many types of widgets are there in Flutter?', ['2', '4', '6', '8+']),
  QuizQuestion(
      'When building for iOS, Flutter is restricted to an __ compilation strategy',
      [
        'AOT (ahead-of-time)',
        'JIT (Just-in-time)',
        'Transcompilation',
        'Recompilation'
      ]),
  QuizQuestion('A sequence of asynchronous Flutter events is known as a:',
      ['Flow', 'Current', 'Stream']),
];
