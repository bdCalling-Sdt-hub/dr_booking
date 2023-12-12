
import 'package:dr_booking/utils/app_colors.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.title});

  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: ScreenUtil().screenWidth,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.foundationColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title.toString(), textAlign: TextAlign.center, style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.whiteColor
        )),
      ),
    );
  }
}
