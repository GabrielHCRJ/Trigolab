import 'package:trigolab/about-screen.dart';
import 'package:trigolab/cosseno/quiz-cosseno.dart';
import 'package:trigolab/tangente/data/questions.dart';
import 'package:trigolab/seno/quiz-seno.dart';
import 'package:trigolab/tangente/start_screen.dart';
import 'package:trigolab/tangenteGtoC/quiz-tangente.dart';
import 'package:trigolab/trigonometria.dart';
import 'package:flutter/material.dart';
import 'package:trigolab/tangente/questions_screen.dart';
import 'package:trigolab/tangente/results_screen.dart';

class QuizTangente extends StatefulWidget {
  const QuizTangente({super.key});

  @override
  State<QuizTangente> createState() {
    return _QuizTangenteState();
  }
}

class _QuizTangenteState extends State<QuizTangente> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/trigonometria': (context) => const Trigonometria(),
        '/atividade-seno': (context) => const QuizSeno(),
        '/atividade-cosseno': (context) => const QuizCosseno(),
        '/atividade-tangente': (context) => const QuizTangente(),
        '/atividade-tangenteGtoC': (context) => const QuizTangenteGtoC(),
        '/about': (context) => const AboutScreen(),
      },
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Color.fromRGBO(9, 147, 172, 100), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: screenWidget,
        ),
      ),
    );
  }
}
