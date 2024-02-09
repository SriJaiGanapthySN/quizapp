import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questionsummary.dart';

class Result extends StatelessWidget {
  const Result({
    super.key,
    required this.rans,
    required this.gana,
  });
  final void Function() gana;
  final List<String> rans;
  List<Map<String, Object>> choosed() {
    final List<Map<String, Object>> canswers = [];
    for (var i = 0; i < rans.length; i++) {
      canswers.add({
        'question_number': i,
        'question': questions[i].question,
        'chosen_answer': rans[i],
        'answer': questions[i].crt,
      });
    }
    return canswers;
  }

  @override
  Widget build(context) {
    final summaryData = choosed();
    final total = questions.length;
    final correct = summaryData.where((data) {
      return data['answer'] == data['chosen_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'You Have Correctly Answered $correct Out Of $total Questions',
              textAlign: TextAlign.center,
              style: GoogleFonts.acme(
                  color: const Color.fromARGB(255, 239, 4, 239), fontSize: 40),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            FilledButton.icon(
              onPressed: gana,
              style: FilledButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              label: const Text(
                'Restart Quiz',
                style: TextStyle(color: Colors.white),
              ),
              icon: const Icon(Icons.troubleshoot_rounded),
            )
          ],
        ),
      ),
    );
  }
}
