import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/styled_text.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            // Check if the answer is correct
            final isCorrect = data['user_answer'] == data['correct_answer'];

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: isCorrect
                      ? const Color.fromARGB(255, 93, 167, 233)
                      : const Color.fromARGB(255, 233, 30, 176), // Conditional color
                  radius: 18,
                  child: StyledText(
                      ((data['question_index'] as int) + 1).toString(),
                      const Color.fromARGB(255, 0, 0, 0),
                      ff: GoogleFonts.lato,
                      fontWeight: FontWeight.bold,
                      20,
                      textpos: TextAlign.center),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  // eita use korle coloumn ta max width theke beshi space nite parbe na
                  child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledText(
                          data['question'] as String,
                          Colors.white,
                          ff: GoogleFonts.lato,
                          fontWeight: FontWeight.bold,
                          20,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        StyledText(
                          data['user_answer'] as String,
                          const Color.fromARGB(255, 225, 175, 245),
                          ff: GoogleFonts.lato,
                          //fontWeight: FontWeight.bold,
                          19,
                        ),
                        StyledText(
                          data['correct_answer'] as String,
                          const Color.fromARGB(255, 153, 194, 255),
                          ff: GoogleFonts.lato,
                          fontWeight: FontWeight.bold,
                          19,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ]),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
