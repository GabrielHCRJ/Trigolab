import 'package:flutter/material.dart';
import 'package:trigolab/widgets/custom-drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  // Método para abrir o link externo
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode
              .externalApplication, // Garante uso do navegador externo
        );
      } else {
        throw 'Não foi possível abrir o link $url';
      }
    } catch (e) {
      debugPrint('Erro ao abrir o link: $url\n$e');
      // Mostra um alerta ao usuário
      _showErrorDialog();
    }
  }

  // Método para exibir um diálogo de erro
  void _showErrorDialog() {
    // Use o contexto do Navigator para exibir o diálogo
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro'),
          content: const Text(
              'Não foi possível abrir o link. Verifique sua conexão com a internet ou tente novamente mais tarde.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trigo Lab',
          style: TextStyle(color: Colors.white, fontSize: 32),
        ),
        backgroundColor: const Color(0xFF007B83), // Cor do AppBar
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF83C9D8),
              Colors.white,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Obrigado por Participar \n\n Responda nosso formulário no Google e nos ajude a melhorar o app cada vez mais',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gamer', // Personalize com sua fonte preferida
                ),
              ),
              const SizedBox(height: 20),
              const Image(
                image: AssetImage(
                    'assets/images/npcs.png'), // Substitua pelo caminho do seu asset
                height: 150,
              ),
              Container(
                width: double.infinity,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 9, 147, 172),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  _launchURL('https://forms.gle/4ZBNkr1ArZYHEwL49');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007B83),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Google Forms',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Adicione esta variável global para acessar o contexto
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
