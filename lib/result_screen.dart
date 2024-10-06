import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:exo_planet/data/questions.dart';
import 'package:exo_planet/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.retartQuiz});

  final void Function() retartQuiz;

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final data = getSummaryData();
    final correctAnswers = data.where(
      (element) {
        return (element['correct_answer'] == element['user_answer']);
      },
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You  answered $correctAnswers out of ${questions.length} questions correctly!",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 204, 187, 220),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          QuestionsSummary(
            summaryData: data,
          ),
          const SizedBox(
            height: 5,
          ),
          TextButton.icon(
            onPressed: retartQuiz,
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
              size: 18,
            ),
            label: Text(
              'Restart Quiz',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}
