import 'package:trigolab/tangenteGtoC/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:trigolab/tangenteGtoC/questions_summary.dart';
import 'package:trigolab/widgets/typing-ballon.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'questions_index': i,
          'question': questions[i].videoUrl,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Você respondeu $numCorrectQuestions de 4 questões corretamente',
              style: TextStyle(fontFamily: 'Gamer'),
            ),
            const SizedBox(
              height: 36,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: QuestionsSummary(summaryData)),
                Column(
                  children: [
                    TypingBalloon(
                        'Clique na alternativa para\n ver a resposta correta',
                        180),
                    Image.asset(
                      'assets/images/npc4.png',
                      width: 200,
                      height: 200,
                    ),
                  ],
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 8,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 9, 147, 172),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
            ),
            SizedBox(
              height: 24,
            ),
            GestureDetector(
              child: Container(
                width: 360,
                height: 80,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 9, 147, 172),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                    child: Text(
                  'Continuar',
                  style: const TextStyle(fontSize: 32, color: Colors.white),
                )),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/feedback');
              },
            ),
          ],
        ),
      ),
    );
  }
}
