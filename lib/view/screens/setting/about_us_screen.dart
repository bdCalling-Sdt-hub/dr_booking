import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        centerTitle: true,
        title: CustomText(
          text: "About Us".toUpperCase(),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.foundationGrey,
              size: 20,
            )),
      ),

      body: const SingleChildScrollView(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 24),
        child: Column(
          children: [

            CustomText(textAlign:TextAlign.start,fontSize:16,fontWeight:FontWeight.w400,color:Color(0xff5C5C5C),text: "All consultations are online via zoom and all medications are mailed to clients from a compounding pharmacy after clients have established an account with the clinic. There a no monthly or membership fees and effectiveness of program will be determined by the Doctor based on evaluations via zoom and also via the monthly progress report form that clients are required to fill monthly via this app."),

          ],
        ),
      ),
    );
  }
}
