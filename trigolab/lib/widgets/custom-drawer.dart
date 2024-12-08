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
            title: const Text('Atividade Duval'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/trigonometria');
            }),
        const Spacer(),
        ListTile(
            title: const Text('Trigonometria no Triangulo Retângulo'),
            onTap: () {}),
        ListTile(title: const Text('Conversor radiano --> grau'), onTap: () {}),
        ListTile(title: const Text('Conversor grau --> radiano'), onTap: () {}),
      ]),
    );
  }
}
