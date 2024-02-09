class QuizQuestion {
  QuizQuestion(this.question, this.text, this.crt);
  final String question;
  final String crt;
  final List<String> text;

  List<String> last() {
    final lastlist = List.of(text);
    lastlist.shuffle();
    return lastlist;
  }
}
