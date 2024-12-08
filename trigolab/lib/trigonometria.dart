import 'package:flutter/material.dart';
import 'package:trigolab/widgets/custom-drawer.dart';

class Trigonometria extends StatelessWidget {
  const Trigonometria({super.key});

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 1, 140, 165),
        ),
        drawer: const CustomDrawer(),
        body: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(width: 500, height: 500, color: Colors.amber),
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
