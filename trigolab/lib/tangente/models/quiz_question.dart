class QuizQuestion {
  const QuizQuestion(this.videoUrl, this.answers);

  final String videoUrl;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
