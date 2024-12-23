import 'package:trigolab/cosseno/quiz-cosseno.dart';
import 'package:trigolab/senoGtoC/data/questions.dart';
import 'package:trigolab/senoGtoC/start_screen.dart';
import 'package:trigolab/tangente/quiz-tangente.dart';
import 'package:trigolab/trigonometria.dart';
import 'package:flutter/material.dart';
import 'package:trigolab/senoGtoC/questions_screen.dart';
import 'package:trigolab/senoGtoC/results_screen.dart';

class QuizSenoGtoC extends StatefulWidget {
  const QuizSenoGtoC({super.key});

  @override
  State<QuizSenoGtoC> createState() {
    return _QuizSenoState();
  }
}

class _QuizSenoState extends State<QuizSenoGtoC> {
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
        '/atividade-cosseno': (context) => const QuizCosseno(),
        '/atividade-tangente': (context) => const QuizTangente(),
        '/atividade-senoGtoC': (context) => const QuizSenoGtoC(),
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
