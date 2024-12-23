import 'package:flutter/material.dart';
import 'package:trigolab/cosseno/answer_button.dart';
import 'package:trigolab/cosseno/data/questions.dart';
import 'package:video_player/video_player.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  late VideoPlayerController _controller;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() {
    _controller =
        VideoPlayerController.asset(questions[currentQuestionIndex].videoUrl)
          ..initialize().then((_) {
            setState(() {
              _isError = false;
            });
            _controller.play();
          }).catchError((error) {
            setState(() {
              _isError = true;
            });
            print('Video initialize error: $error');
          });
  }

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
      if (currentQuestionIndex < questions.length) {
        _controller.dispose();
        _initializeVideo();
      } else {
        _controller.dispose();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color.fromARGB(255, 9, 147, 172), Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Center(
            child: _isError
                ? const Text(
                    'Erro ao carregar o vídeo',
                    style: TextStyle(color: Colors.red, fontSize: 18),
                    textAlign: TextAlign.center,
                  )
                : _controller.value.isInitialized
                    ? Stack(
                        children: [
                          ClipRect(
                            child: Align(
                              alignment: Alignment.center,
                              child: Transform.scale(
                                scale:
                                    2.4, // Ajuste o fator de escala conforme necessário
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: SizedBox(
                                    width: _controller.value.size.width,
                                    height: _controller.value.size.height,
                                    child: VideoPlayer(_controller),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Transform.translate(
                              offset: const Offset(0,
                                  -80), // Ajuste o valor Y conforme necessário
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ...currentQuestion.getShuffledAnswers().map(
                                      (answer) {
                                        return AnswerButton(
                                          answerText: answer,
                                          onTap: () {
                                            answerQuestion(answer);
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
