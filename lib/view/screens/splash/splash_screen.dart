import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/utils/app_strings.dart';
import 'package:dr_booking/view/screens/home/home_screen.dart';
import 'package:dr_booking/view/widgets/bottom_nav/custom_bottom_nav_bar.dart';
import 'package:dr_booking/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/app_icons.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      // Check if the widget is still mounted before navigating
      if (mounted) {
         Get.to(() => const CustomNavBar());
      }
    });
  }
  @override
  Widget build(BuildContext context) {

  var  width = MediaQuery.of(context).size.width/2;
  var  height = MediaQuery.of(context).size.height/2;
    return  Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppIcons.logo,color: AppColors.foundationColor,width: width,height: height,)
        ],
      ),
    );
  }
}
