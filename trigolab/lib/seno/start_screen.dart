import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trigolab/widgets/custom-drawer.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TrigoLab',
            style: TextStyle(color: Colors.white, fontSize: 32)),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 1, 140, 165),
      ),
      drawer: const CustomDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(9, 147, 172, 100),
              Colors.white, // Gradiente até branco
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Gráfico superior
                Container(
                  width: 360,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    'assets/images/grafico_circulo.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/images/npc2.png',
                      width: 200,
                      height: 200,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 200,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Text(
                            'Sua tarefa é associar o valor do ângulo no círculo ao valor da função trigonométrica correspondente no gráfico da função cosseno',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  ],
                ),
                //Divisória
                Container(
                  width: double.infinity,
                  height: 8,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 9, 147, 172),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
                SizedBox(
                  height: 16,
                ),
                // Botão de iniciar
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12),
                  ),
                  onPressed: startQuiz,
                  child: const Text(
                    'Começar',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                // Gráfico inferior
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: 360,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    'assets/images/grafico_cosseno.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//   @override
//   Widget build(context) {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             color: Colors.deepPurple,
//             width: 300,
//             height: 300,
//             child: const Center(
//               child: Text(
//                 'Adicionar informações sobre as atividades aqui',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 32,
//           ),
//           Text(
//             'Começar a atividade',
//             style: GoogleFonts.lato(
//               color: const Color.fromARGB(255, 195, 163, 247),
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 32),
//           Row(
//             children: [
//               OutlinedButton.icon(
//
//                 style: OutlinedButton.styleFrom(
//                     foregroundColor: const Color.fromARGB(255, 96, 238, 84)),
//                 icon: const Icon(Icons.arrow_right_alt),
//                 label: const Text(
//                   'Start',
//                   style: TextStyle(
//                     color: Color.fromARGB(255, 204, 183, 233),
//                     fontSize: 32,
//                   ),
//                 ),
//               ),
//               OutlinedButton.icon(
//                 onPressed: () {
//                   Navigator.pushReplacementNamed(context, '/trigonometria');
//                 },
//                 style: OutlinedButton.styleFrom(
//                     foregroundColor: const Color.fromARGB(255, 96, 238, 84)),
//                 icon: const Icon(Icons.arrow_right_alt),
//                 label: const Text(
//                   'Voltar ao xeni',
//                   style: TextStyle(
//                     color: Color.fromARGB(255, 204, 183, 233),
//                     fontSize: 32,
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
