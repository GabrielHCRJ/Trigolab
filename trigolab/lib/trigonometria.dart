import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trigolab/widgets/custom-drawer.dart';
import 'package:trigolab/widgets/typing-ballon.dart';

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
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 9, 147, 172),
                    Colors.white
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  child: Center(
                    child: TypingBalloon(
                        'Bem-vindo ao TrigoLab!\nAqui você vai explorar as funções trigonométricas, relacionando o círculo trigonométrico ao plano cartesiano.\n\nVamos começar?',
                        300),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 200,
                      child: Image.asset('assets/images/npc1.png'),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
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
