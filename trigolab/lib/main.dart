import 'package:trigolab/about-screen.dart';
import 'package:trigolab/cosGtoC/quiz-cosseno.dart';
import 'package:trigolab/cosseno/quiz-cosseno.dart';
import 'package:trigolab/feedbackscreen.dart';
import 'package:trigolab/seno/quiz-seno.dart';
import 'package:trigolab/senoGtoC/quiz-seno.dart';
import 'package:trigolab/tangente/quiz-tangente.dart';

import 'package:trigolab/trigonometria.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
        title: 'Trigo Sem Drama',
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(colorSchemeSeed: const Color.fromARGB(255, 1, 140, 165)),
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginPage(),
          '/home': (context) => const Home(),
          '/trigonometria': (context) => const Trigonometria(),
          '/atividade-seno': (context) => const QuizSeno(),
          '/atividade-cosseno': (context) => const QuizCosseno(),
          '/atividade-tangente': (context) => const QuizTangente(),
          '/atividade-cosGtoC': (context) => const QuizCosGtoC(),
          '/atividade-senoGtoC': (context) => const QuizSenoGtoC(),
          '/about': (context) => const AboutScreen(),
          '/feedback': (context) => const FeedbackScreen(),
        });
  }
}
