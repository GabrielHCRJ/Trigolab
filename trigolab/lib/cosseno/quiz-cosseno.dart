import 'package:trigolab/about-screen.dart';
import 'package:trigolab/cosGtoC/quiz-cosseno.dart';
import 'package:trigolab/cosseno/data/questions.dart';
import 'package:trigolab/seno/quiz-seno.dart';
import 'package:trigolab/cosseno/start_screen.dart';
import 'package:trigolab/tangente/quiz-tangente.dart';
import 'package:trigolab/trigonometria.dart';
import 'package:flutter/material.dart';
import 'package:trigolab/cosseno/questions_screen.dart';
import 'package:trigolab/cosseno/results_screen.dart';

class QuizCosseno extends StatefulWidget {
  const QuizCosseno({super.key});

  @override
  State<QuizCosseno> createState() {
    return _QuizCossenoState();
  }
}

class _QuizCossenoState extends State<QuizCosseno> {
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
        '/atividade-cosGtoC': (context) => const QuizCosGtoC(),
        '/about': (context) => const AboutScreen(),
      },
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Color.fromRGBO(9, 147, 172, 100), Colors.white],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          )),
          child: screenWidget,
        ),
      ),
    );
  }
}
