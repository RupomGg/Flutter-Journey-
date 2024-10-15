import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/styled_text.dart';
import 'package:quiz_app/data/questions.dart';

// ignore: unused_import
import 'package:quiz_app/models/quiz_question.dart';


class QuestionScreen extends StatefulWidget {
   const QuestionScreen({super.key,required this.onSelectAnswer,});
  
  final void Function(String answer) onSelectAnswer; //why ? #026

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {

  var currentQuestionIdx = 0;
  
  void answerQuestion(String selectedAnswers){
    widget.onSelectAnswer(selectedAnswers);
    setState(() {
       currentQuestionIdx++;
      });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIdx];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StyledText(
            currentQuestion.text,
            const Color.fromARGB(255, 201, 153, 251),
            ff:GoogleFonts.lato,
            fontWeight: FontWeight.bold,
            20, textpos:TextAlign.center
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer){ //dynamically generation
              return AnswerButton(answer, (){
                answerQuestion(answer);
              },);
            })
          ], 
        ),
      ),
    );
  }
}
