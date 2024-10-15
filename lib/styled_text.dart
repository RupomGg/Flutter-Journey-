//import 'dart:ffi';

import 'package:flutter/material.dart';
//mport 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.outputText,this.textColor,this.textSize, {this.textpos,this.ff, this.fontWeight,super.key});

  final String outputText;
  final Color textColor;
  final double? textSize;
  final TextAlign? textpos;
  final TextStyle Function({Color? color, double? fontSize})? ff; //optional font family
  final FontWeight? fontWeight; // Optional fontWeight

  @override
  Widget build(context) {
    return Text(
      outputText,
      style: ff !=null
      ? ff!(color: textColor, fontSize: textSize).copyWith(fontWeight: fontWeight)
      : TextStyle(
        color: textColor,
        fontSize: textSize, 
        fontWeight: fontWeight,       
      ),
      textAlign: textpos,
    );
  }
}
