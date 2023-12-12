import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/utils/app_strings.dart';
import 'package:dr_booking/view/screens/home/home_screen.dart';
import 'package:dr_booking/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      // Check if the widget is still mounted before navigating
      if (mounted) {
         Get.to(() => const HomeScreen());
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return    const Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              textAlign: TextAlign.center,
             text: AppStrings.splashTExt,
              color: AppColors.foundationColor,
              fontSize: 36,
            ),
          ],
        ),
      ),
    );
  }
}
