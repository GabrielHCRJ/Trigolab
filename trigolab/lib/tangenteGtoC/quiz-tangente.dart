import 'package:trigolab/cosseno/quiz-cosseno.dart';
import 'package:trigolab/feedbackscreen.dart';
import 'package:trigolab/tangente/quiz-tangente.dart';
import 'package:trigolab/tangenteGtoC/data/questions.dart';
import 'package:trigolab/seno/quiz-seno.dart';
import 'package:trigolab/tangenteGtoC/start_screen.dart';
import 'package:trigolab/trigonometria.dart';
import 'package:flutter/material.dart';
import 'package:trigolab/tangenteGtoC/questions_screen.dart';
import 'package:trigolab/tangenteGtoC/results_screen.dart';

class QuizTangenteGtoC extends StatefulWidget {
  const QuizTangenteGtoC({super.key});

  @override
  State<QuizTangenteGtoC> createState() {
    return _QuizTangenteStateGtoC();
  }
}

class _QuizTangenteStateGtoC extends State<QuizTangenteGtoC> {
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
        '/atividade-tangenteGtoC': (context) => const QuizTangenteGtoC(),
        '/feedback': (context) => const FeedbackScreen(),
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
