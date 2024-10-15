import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/styled_text.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.choosenAnswers, this.restartQuiz, {super.key});

  final List<String> choosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      //loop body
      summary.add({
        //{} basically a dictionary of python
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();

    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length; //why inside build?

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StyledText(
              'You answerd $numCorrectQuestions out of $numTotalQuestions questions Correctly!',
              const Color.fromARGB(255, 201, 153, 251),
              ff: GoogleFonts.lato,
              fontWeight: FontWeight.bold,
              25,
            ),
            const SizedBox(
              height: 40,
            ),
            QuestionsSummary(summaryData),
            TextButton.icon(
                onPressed: restartQuiz,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  //backgroundColor: const Color.fromARGB(255, 47, 4, 100),
                  textStyle: const TextStyle(fontSize: 25),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                ),
                icon: const Icon(Icons.restart_alt_outlined),
                label: const Text("Restart Quiz"))
          ],
        ),
      ),
    );
  }
}
