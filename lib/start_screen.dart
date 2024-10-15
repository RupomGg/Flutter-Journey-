import 'package:flutter/material.dart';
import 'package:quiz_app/styled_text.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(155, 255, 255, 255),
        ),
        const SizedBox(height: 80),
        const StyledText(
          "Learn Flutter the Fun way",
          Color.fromARGB(255, 237, 223, 252),
          25,
          textpos: TextAlign.center,
          fontWeight: FontWeight.bold,
          ff: GoogleFonts.lato,
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
          onPressed: startQuiz, //line 8
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 25),
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            side: const BorderSide(color: Colors.black, width: 0.2),
          ),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text("Start Quiz"),
        )
      ]),
    );
  }
}
