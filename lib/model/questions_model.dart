class QuizQuestion {
  final String question;
  final List<String> answer;

  const QuizQuestion(this.question, this.answer);

  List<String> getShuffledAnswer() {
    final shuffledAnswer = List.of(answer);
    shuffledAnswer.shuffle();
    return shuffledAnswer;
  }
}
