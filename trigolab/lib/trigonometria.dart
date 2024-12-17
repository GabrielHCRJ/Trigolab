import 'package:flutter/material.dart';
import 'package:trigolab/widgets/custom-drawer.dart';

class Trigonometria extends StatelessWidget {
  const Trigonometria({super.key});

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TrigoLab',
              style: TextStyle(color: Colors.white, fontSize: 32)),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 1, 140, 165),
        ),
        drawer: const CustomDrawer(),
        body: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                width: 500,
                height: 500,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Container do balão de fala
                      Container(
                        margin: const EdgeInsets.only(
                            bottom: 20), // Espaço entre a imagem e o balão
                        padding:
                            const EdgeInsets.all(16), // Espaçamento interno
                        width: 300, // Largura do balão
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(16), // Bordas arredondadas
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: const Offset(0, 4), // Sombra para baixo
                            ),
                          ],
                        ),
                        child: const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Bem-vindo ao ',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              TextSpan(
                                text: 'TrigoLab!',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                              ),
                              TextSpan(
                                text:
                                    '\nAqui você vai explorar as funções trigonométricas conectando o círculo trigonométrico ao plano cartesiano.\n\nVamos começar?',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      // Imagem ou ícone do personagem
                      SizedBox(
                        height: 200,
                        child: Image.asset(
                            'assets/images/npc1.png'), // Caminho do asset
                      ),
                      // Linha decorativa abaixo do personagem
                    ],
                  ),
                ),
              ),
              Container(
                width: 360,
                height: 8,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 9, 147, 172),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
              SizedBox(height: 8),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AttBox('Função Seno', '/atividade-seno'),
                    AttBox('Função Cosseno', '/atividade-cosseno'),
                    AttBox('Função Tangente', '/atividade-tangente'),
                  ])
            ]),
          ),
        ));
  }
}

class AttBox extends StatelessWidget {
  AttBox(this.texto, this.rota, {super.key});

  String texto;
  String rota;

  @override
  Widget build(context) {
    return Column(
      children: [
        GestureDetector(
          child: Container(
            width: 360,
            height: 80,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 9, 147, 172),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
                child: Text(
              texto,
              style: const TextStyle(fontSize: 32),
            )),
          ),
          onTap: () {
            Navigator.pushNamed(context, rota);
          },
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
