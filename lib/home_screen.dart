import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Learn ExoPlanets the fun way!',
            style: TextStyle(
              color: Color.fromARGB(255, 245, 235, 236),
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(95, 27, 25, 25)),
            onPressed: startQuiz,
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
            label: const Text(
              'Start Quiz',
              style: TextStyle(
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
