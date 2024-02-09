import 'package:flutter/material.dart';

class StarTran extends StatelessWidget {
  const StarTran(this.quiz, {super.key});
  final void Function() quiz;
  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: 250),
        Center(
          child: Image.asset(
            "assets/images/abd3.png",
            height: 390,
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () {
            quiz();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          label: const Text("Start-Quiz"),
          icon: const Icon(Icons.access_alarm_sharp),
        )
      ],
    );
  }
}
