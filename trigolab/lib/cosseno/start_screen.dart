import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.deepPurple,
            width: 300,
            height: 300,
            child: const Center(
              child: Text(
                'Adicionar informações sobre as atividades aqui',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            'Começar a atividade',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 195, 163, 247),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              OutlinedButton.icon(
                onPressed: startQuiz,
                style: OutlinedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 96, 238, 84)),
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text(
                  'Start',
                  style: TextStyle(
                    color: Color.fromARGB(255, 204, 183, 233),
                    fontSize: 32,
                  ),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/trigonometria');
                },
                style: OutlinedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 96, 238, 84)),
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text(
                  'Voltar ao xnu',
                  style: TextStyle(
                    color: Color.fromARGB(255, 204, 183, 233),
                    fontSize: 32,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
