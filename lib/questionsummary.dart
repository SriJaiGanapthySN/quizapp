import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.dat, {super.key});
  final List<Map<String, Object>> dat;
  @override
  Widget build(context) {
    return SizedBox(
      height: 320,
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: dat.map(
              (data) {
                return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            color: Colors.amberAccent,
                            borderRadius: BorderRadius.circular(90)),
                        child: Text(
                          ((data['question_number'] as int) + 1).toString(),
                          textAlign: TextAlign.left,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (data['answer']) as String,
                              style: const TextStyle(
                                color: Colors.green,
                              ),
                            ),
                            Text(
                              (data['chosen_answer']) as String,
                              textAlign: TextAlign.left,
                              style: const TextStyle(color: Colors.red),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      )
                    ]);
              },
            ).toList()),
      ),
    );
  }
}
