import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Answer extends StatelessWidget {
  const Answer({
    super.key,
    required this.onClick,
    required this.answertext,
  });
  final String answertext;
  final void Function() onClick;
  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amberAccent,
            shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 100)),
        child: Text(
          answertext,
          textAlign: TextAlign.center,
          style: GoogleFonts.acme(color: Colors.black, fontSize: 15),
        ));
  }
}
