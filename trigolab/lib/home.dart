import 'package:flutter/material.dart';
import 'package:trigolab/widgets/custom-drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('TrigoLab',
              style: TextStyle(color: Colors.white, fontSize: 32)),
          backgroundColor: const Color.fromARGB(255, 1, 140, 165)),
      drawer: const CustomDrawer(),
      body: Center(
          child: Container(
        color: Color.fromARGB(255, 1, 140, 165),
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
      )),
    );
  }
}
