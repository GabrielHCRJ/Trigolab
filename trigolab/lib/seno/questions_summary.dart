import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  void _showCustomDialog(BuildContext context, int index) {
    // Define os caminhos das imagens nos assets
    final imagePaths = [
      'assets/images/SenoQ1R.png', // Imagem para o círculo 1
      'assets/images/image2.png', // Imagem para o círculo 2
      'assets/images/image3.png', // Imagem para o círculo 3
      'assets/images/image4.png', // Imagem para o círculo 4
    ];

    // Verifica se o índice é válido antes de exibir o diálogo
    if (index >= 0 && index < imagePaths.length) {
      showDialog(
        context: context,
        builder: (ctx) => Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Bordas arredondadas
          ),
          child: Container(
            padding: const EdgeInsets.all(20), // Espaçamento interno
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade100, // Fundo do container
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Exibe a imagem correspondente
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    imagePaths[index],
                    fit: BoxFit.cover,
                    height: 400, // Ajusta a altura da imagem
                    width:
                        double.infinity, // Faz a largura ocupar todo o espaço
                  ),
                ),
                const SizedBox(height: 20),
                // Título ou descrição (opcional)
                Text(
                  'Questão ${index + 1}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                // Botão personalizado
                ElevatedButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Fechar'),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data) {
        final int questionIndex = data['questions_index'] as int;
        final bool isCorrect = data['user_answer'] == data['correct_answer'];

        return Padding(
          padding: const EdgeInsets.only(
              bottom: 48), // Espaçamento entre as perguntas
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => _showCustomDialog(context, questionIndex),
                child: Container(
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
                    (questionIndex + 1).toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
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
