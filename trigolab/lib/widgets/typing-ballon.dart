import 'dart:async';
import 'package:flutter/material.dart';

class TypingBalloon extends StatefulWidget {
  final String text; // Texto que será exibido
  final double width;

  const TypingBalloon(this.text, this.width, {Key? key}) : super(key: key);

  @override
  _TypingBalloonState createState() => _TypingBalloonState();
}

class _TypingBalloonState extends State<TypingBalloon> {
  String displayedText = "";
  int charIndex = 0;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTyping();
  }

  void startTyping() {
    _timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (charIndex < widget.text.length) {
        setState(() {
          displayedText += widget.text[charIndex];
          charIndex++;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, top: 20),
      padding: const EdgeInsets.all(16),
      width: widget.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        displayedText,
        style: const TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 0, 9, 127),
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

// class TypingBalloon extends StatefulWidget {
//   @override
//   _TypingBalloonState createState() => _TypingBalloonState();
// }

// class _TypingBalloonState extends State<TypingBalloon> {
//   final String fullText =
//       'Bem-vindo ao TrigoLab!\nAqui você vai explorar as funções trigonométricas, relacionando o círculo trigonométrico ao plano cartesiano.\n\nVamos começar?';
//   String displayedText = "";
//   int charIndex = 0;

//   late Timer _timer;

//   @override
//   void initState() {
//     super.initState();
//     startTyping();
//   }

//   void startTyping() {
//     _timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
//       if (charIndex < fullText.length) {
//         setState(() {
//           displayedText += fullText[charIndex];
//           charIndex++;
//         });
//       } else {
//         _timer.cancel();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 20, top: 20),
//       padding: const EdgeInsets.all(16),
//       width: 300,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 2,
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Text(
//         displayedText,
//         style: const TextStyle(
//             fontSize: 20,
//             color: Color.fromARGB(255, 0, 9, 127),
//             fontWeight: FontWeight.w600),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }
// }
