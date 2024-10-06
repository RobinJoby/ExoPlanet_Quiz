import 'package:flutter/material.dart';
import 'package:exo_planet/data/questions.dart';
import 'package:exo_planet/home_screen.dart';
import 'package:exo_planet/questions_screen.dart';
import 'package:exo_planet/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget activeScreen= HomeWidget(changeScreen); not possible as the both initialization and the function takes place simultaneoslly instead use the initstte method
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = HomeWidget(changeScreen);
  //   super.initState();
  // }

  var activeScreen = 'home-screen';

  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'result-screen';
      });
    }
  }

  void changeScreen() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    // Widget screen = (activeScreen == 'home-screen')
    //     ? HomeWidget(changeScreen)
    //     : QuestionsScreen(
    //         onSelectAnswer: chooseAnswer,
    //       );
    Widget? screen;
    if (activeScreen == 'home-screen') {
      screen = HomeWidget(changeScreen);
    } else if (activeScreen == 'questions-screen') {
      screen = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == 'result-screen') {
      screen = ResultScreen(
        chosenAnswers: selectedAnswers,
        retartQuiz: changeScreen,
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(40),
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              'assets/pexels-egos68-1906658.jpg',
            ),
            fit: BoxFit.cover,
          )),
          child: screen,
          // child: (activeScreen == 'home-screen')
          //     ? HomeWidget(changeScreen)
          //     : const QuestionsScreen(),
        ),
      ),
    );
  }
}
