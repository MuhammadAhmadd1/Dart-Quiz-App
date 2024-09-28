class QuizQuestions {
  const QuizQuestions(this.text,this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers(){
    final shufflesList = List.of(answers);
    shufflesList.shuffle();
    return shufflesList;
  }
}