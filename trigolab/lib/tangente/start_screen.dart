import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trigolab/widgets/custom-drawer.dart';
import 'package:trigolab/widgets/typing-ballon.dart';

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
        padding: EdgeInsets.all(12),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Gráfico superior
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    'assets/images/circuloTrigonometrico.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 280,
                          child: TypingBalloon(
                              'Sua tarefa é associar o valor do ângulo no círculo ao valor da função trigonométrica correspondente no gráfico da função tangente',
                              240),
                        ),
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
                        SizedBox(
                          height: 4,
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/npc4.png',
                          width: 140,
                          height: 150,
                        ),
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
                  height: 4,
                ),

                // Gráfico inferior
                SizedBox(
                  height: 4,
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Expanded(
                    child: Image.asset(
                      'assets/images/funcaoTangente.png',
                      fit: BoxFit.contain,
                    ),
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
