import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answer, required this.onTap});
  final String answer;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(53, 35, 8, 82),
          foregroundColor: const Color.fromARGB(255, 244, 241, 241),
          textStyle: const TextStyle(
            fontSize: 13,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 1,
            horizontal: 40,
          )),
      child: Text(
        answer,
        textAlign: TextAlign.center,
      ),
    );
  }
}
