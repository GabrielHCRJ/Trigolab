import 'package:trigolab/cosseno/quiz-cosseno.dart';
import 'package:trigolab/seno/data/questions.dart';
import 'package:trigolab/seno/start_screen.dart';
import 'package:trigolab/tangente/quiz-tangente.dart';
import 'package:trigolab/trigonometria.dart';
import 'package:flutter/material.dart';
import 'package:trigolab/seno/questions_screen.dart';
import 'package:trigolab/seno/results_screen.dart';

class QuizSeno extends StatefulWidget {
  const QuizSeno({super.key});

  @override
  State<QuizSeno> createState() {
    return _QuizSenoState();
  }
}

class _QuizSenoState extends State<QuizSeno> {
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
      debugShowCheckedModeBanner: true,
      initialRoute: '/',
      routes: {
        '/trigonometria': (context) => const Trigonometria(),
        '/atividade-seno': (context) => const QuizSeno(),
        '/atividade-cosseno': (context) => const QuizCosseno(),
        '/atividade-tangente': (context) => const QuizTangente(),
      },
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 63, 22, 134),
              Color.fromARGB(255, 180, 162, 211)
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          )),
          child: screenWidget,
        ),
      ),
    );
  }
}
