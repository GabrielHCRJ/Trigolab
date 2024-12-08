import 'package:flutter/material.dart';

void main() {
  runApp(const LoginPage());
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(context) {
    return Container(
      color: Colors.white,
      child: Center(
          child: GestureDetector(
              child: Container(
                  color: const Color.fromARGB(255, 1, 140, 165),
                  child: const Center(
                    child: Image(
                        image: AssetImage('assets/images/logoTrigoLab.png')),
                  )),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/trigonometria');
              })),
    );
  }
}
