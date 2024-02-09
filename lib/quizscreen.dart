import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quizapp/answerbutton.dart';

import 'package:quizapp/data/questions.dart';

class Quizscreen extends StatefulWidget {
  const Quizscreen({super.key, required this.onselect});
  final void Function(String answer) onselect;
  @override
  State<Quizscreen> createState() {
    return _QuizscreenState();
  }
}

class _QuizscreenState extends State<Quizscreen> {
  var index = 0;

  void answerQuestion(String answer) {
    widget.onselect(answer);
    setState(() {
      index = index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[index];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.acme(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.last().map((text) {
              return Answer(
                answertext: text,
                onClick: () {
                  answerQuestion(text);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
