import 'package:flutter/material.dart';
import 'package:exo_planet/answer_button.dart';
import 'package:exo_planet/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

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

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 233, 220, 236),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.getShuffledList().map(
              // ... is the spread operator
              (e) {
                return Column(children: [
                  AnswerButton(
                    answer: e,
                    onTap: () {
                      answerQuestion(e);
                    },
                  ),
                  const SizedBox(
                    height: 2,
                  )
                ]);
              },
            )
          ],
        ),
      ),
    );
  }
}
