
import 'package:dr_booking/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomElevatedButton extends StatelessWidget {

  final VoidCallback onPressed;
  final String titleText;
  final Color titleColor;
  final Color buttonColor;
  final Color borderColor;
  final double titleSize;
  final FontWeight titleWeight;
  final double buttonRadius;
  final double buttonHeight;
  final double? buttonWidth;
  // final bool isGradient;

   const CustomElevatedButton({
      required this.onPressed,
      required this.titleText,
      this.titleColor = Colors.white,
      this.buttonColor = AppColors.foundationColor,
      this.titleSize = 16,
      this.buttonRadius = 8,
      this.titleWeight = FontWeight.w600,
      this.buttonHeight = 56,
      this.buttonWidth,
      this.borderColor = AppColors.foundationColor,
      // this.isGradient = true,
      super.key});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        height: buttonHeight,
        alignment: Alignment.center,
        decoration:BoxDecoration(
          color: buttonColor,
          border: Border.all(
            color: borderColor,
            width: 1
          ),
          borderRadius: BorderRadius.circular(buttonRadius)
        ),
        child: Text(
          titleText,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            color: titleColor,
            fontSize: titleSize ,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
