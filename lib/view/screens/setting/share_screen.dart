import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/utils/app_routes.dart';
import 'package:dr_booking/utils/app_strings.dart';
import 'package:dr_booking/view/widgets/buttons/custom_button.dart';
import 'package:dr_booking/view/widgets/buttons/custom_elevated_button.dart';
import 'package:dr_booking/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class ShareScreen extends StatelessWidget {
  const ShareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        centerTitle: true,
        title: CustomText(
          text: "Share App".toUpperCase(),
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
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(onTap: (){
              Get.toNamed(AppRoute.paymentScreen);
            },title: 'For iOS',),
           const SizedBox(height: 16,),
      CustomElevatedButton(
        onPressed: () {
          // Get.toNamed(AppRoute.preogressSreen    );
        },
        titleColor: AppColors.foundationColor,
        titleText: "For Android",
        buttonColor: AppColors.whiteColor,
        borderColor: AppColors.foundationColor,
        buttonRadius: 8,

      ),


          ],
        ),
      ),
    );
  }
}