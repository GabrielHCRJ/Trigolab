import 'package:trigolab/seno/data/questions.dart';
import 'package:trigolab/seno/quiz-seno.dart';
import 'package:trigolab/cosGtoC/start_screen.dart';
import 'package:trigolab/tangente/quiz-tangente.dart';
import 'package:trigolab/trigonometria.dart';
import 'package:flutter/material.dart';
import 'package:trigolab/seno/questions_screen.dart';
import 'package:trigolab/seno/results_screen.dart';

class QuizCosGtoC extends StatefulWidget {
  const QuizCosGtoC({super.key});

  @override
  State<QuizCosGtoC> createState() {
    return _QuizCosGtoC();
  }
}

class _QuizCosGtoC extends State<QuizCosGtoC> {
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
        '/atividade-cosseno': (context) => const QuizCosGtoC(),
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
