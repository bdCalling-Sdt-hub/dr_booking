import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/utils/app_images.dart';
import 'package:dr_booking/utils/app_routes.dart';
import 'package:dr_booking/utils/app_strings.dart';
import 'package:dr_booking/view/widgets/buttons/custom_elevated_button.dart';
import 'package:dr_booking/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/app_icons.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
    top: false,

      child: Scaffold(
         backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          // backgroundColor: AppColors.bgColor,
          toolbarHeight: 120,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: SvgPicture.asset(AppIcons.logo,color: AppColors.foundationColor,),

        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
               clipBehavior:Clip.none,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 8),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppColors.foundationColor1,
                        border: Border.all(color: AppColors.foundationColor, width: 1),
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width:100,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           CustomText(
                             text: AppStrings.title,
                             color: AppColors.foundationGrey,
                             fontSize: 14,
                             fontWeight: FontWeight.w400,
                             textAlign: TextAlign.start,
                           ),
                           CustomText(
                             textAlign: TextAlign.start,
                             bottom: 12,
                             text: AppStrings.subTitle,
                             color: AppColors.foundationGrey,
                             fontSize: 20,
                             fontWeight: FontWeight.w500,
                           ),
                           CustomText(
                             bottom: 12,
                             textAlign: TextAlign.start,
                             text: AppStrings.subTitle1,
                             color: AppColors.foundationColor,
                             fontSize: 14,
                             fontWeight: FontWeight.w600,
                             maxLines: 2,
                             textOverflow: TextOverflow.ellipsis,
                           ),
                         ],
                        ),
                        SizedBox(),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -20,
                    left: 0,
                    bottom: 0,
                    child: SizedBox(
                      child: Image.asset(
                        AppImages.bannerImage,
                        height: 170,
                        width: 120,
                      ),
                    ),
                  ),
                ],
              ),
               // SizedBox(height: Get.height*0.3,),
              Column(
                children: [
                  CustomElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.initialForm);
                    },
                    titleText: AppStrings.newPatient,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.preogressSreen    );
                    },
                    titleColor: AppColors.foundationColor,
                    titleText: AppStrings.existingPatient,
                    buttonColor: AppColors.whiteColor,
                    borderColor: AppColors.foundationColor,
                    buttonRadius: 8,
                  ),
                ],
              ),
              SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
