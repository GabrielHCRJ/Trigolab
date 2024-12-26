import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Color.fromARGB(255, 1, 140, 165)),
          child: Center(
              child:
                  Image(image: AssetImage('assets/images/logoTrigoLab.png'))),
        ),
        ListTile(
            title: const Text('Função Seno'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/atividade-seno');
            }),
        ListTile(
            title: const Text('Função Coseno'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/atividade-cosseno');
            }),
        ListTile(
            title: const Text('Função Tangente'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/atividade-tangente');
            }),
        ListTile(
            title: const Text('About'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/about');
            }),
      ]),
    );
  }
}
