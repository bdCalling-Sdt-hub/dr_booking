// import 'package:dr_appointment/utils/app_colors.dart';
import 'package:dr_booking/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
        this.maxLines ,
        this.textAlign = TextAlign.center,
       this.left = 0,
       this.right = 0,
       this.top = 0,
       this.bottom = 0,
       this.fontSize = 14,
       this.fontWeight =FontWeight.w600,
       this.color = AppColors.foundationGrey,

      required this.text, this.textOverflow});

  final double left;
  final double right;
  final double top;
  final double bottom;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final String text;
  final TextAlign textAlign;
  final int ? maxLines;
  final TextOverflow ? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: Text(textAlign: textAlign,
        text,maxLines: maxLines,
        overflow: textOverflow,
        style: GoogleFonts.lato(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,

        ),
      ),
    );
  }
}
