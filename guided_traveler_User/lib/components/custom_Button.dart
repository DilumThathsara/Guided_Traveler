import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guided_traveler/utils/app_Colors.dart';

class customButton extends StatelessWidget {
  const customButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.isLoading = false,
  }) : super(key: key);

  final Function() onTap;
  final String text;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 259,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: isLoading
            ? const CircularProgressIndicator.adaptive(
                backgroundColor: AppColors.white,
              )
            : Text(
                text,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
      ),
    );
  }
}
