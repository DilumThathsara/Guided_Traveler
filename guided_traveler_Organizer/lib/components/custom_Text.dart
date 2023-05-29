import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guided_traveler/utils/app_Colors.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.text, {
    this.fontSize = 30,
    this.fontWeight = FontWeight.w600,
    this.color = AppColors.primaryColor,
    this.textAlign = TextAlign.center,
    Key? key,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}
