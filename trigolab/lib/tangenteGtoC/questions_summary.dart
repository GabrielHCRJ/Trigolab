import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data) {
        final bool isCorrect = data['user_answer'] == data['correct_answer'];

        return Padding(
          padding: const EdgeInsets.only(
              bottom: 48), // Espaçamento entre as perguntas
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isCorrect
                      ? const Color.fromARGB(124, 17, 216, 48)
                      : const Color.fromARGB(124, 244, 67, 54),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  ((data['questions_index'] as int) + 1).toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                  width: 16), // Espaçamento entre o círculo e o texto
              // Resposta correta
              Expanded(
                child: Text(
                  '${(data['correct_answer'] as String)}',
                  style: const TextStyle(fontSize: 16, fontFamily: 'Gamer'),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
