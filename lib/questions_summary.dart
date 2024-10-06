import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(((data['question_index'] as int) + 1).toString()),
                CircleAvatar(
                  radius: 12,
                  backgroundColor: data['user_answer'] != data['correct_answer']
                      ? const Color.fromARGB(255, 227, 102, 206)
                      : const Color.fromARGB(255, 109, 200, 151),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                  ),
                ),
                // const SizedBox(
                //   width: 5,
                // ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            color: const Color.fromARGB(196, 215, 89, 131),
                          ),
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            color: const Color.fromARGB(255, 109, 200, 151),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
