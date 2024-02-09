import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/startscreen.dart';
import 'package:quizapp/quizscreen.dart';
import 'package:quizapp/result.dart';

class Click extends StatefulWidget {
  const Click({super.key});
  @override
  State<Click> createState() {
    return _ClickState();
  }
}

class _ClickState extends State<Click> {
  List<String> selectedanswers = [];
  var activeScreen = 'startscreen';
  void setScreen() {
    setState(() {
      activeScreen = 'questionscreen';
      selectedanswers = [];
    });
  }

  void choose(String answer) {
    selectedanswers.add(answer);

    if (selectedanswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void retart() {
    if (activeScreen == 'result-screen') {
      setState(() {
        activeScreen = 'startscreen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StarTran(setScreen);
    if (activeScreen == 'questionscreen') {
      screenWidget = Quizscreen(onselect: choose);
    }
    if (activeScreen == 'result-screen') {
      screenWidget = Result(
          rans: selectedanswers,
          gana: () {
            retart();
          });
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: SweepGradient(colors: <Color>[
            Color.fromARGB(255, 0, 2, 0),
            Color.fromARGB(255, 3, 0, 0),
            Color.fromARGB(255, 1, 5, 18),
          ])),
          child: screenWidget,
        ),
      ),
    );
  }
}
