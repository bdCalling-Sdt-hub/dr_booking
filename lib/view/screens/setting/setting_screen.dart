import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/utils/app_routes.dart';
import 'package:dr_booking/view/screens/home/home_screen.dart';
import 'package:dr_booking/view/widgets/buttons/custom_button.dart';
import 'package:dr_booking/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  List<String> methodName =  ["Terms & Condition","Privacy Policy","About Us","Contact Us"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.bgColor,
        centerTitle: true,
        title: CustomText(
          text: "Setting".toUpperCase(),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      body:  SingleChildScrollView(
        padding:  const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: List.generate(methodName.length, (index){
                return  GestureDetector(
                  onTap: (){
                    setState(() {
                      index == 0 ? Get.toNamed(AppRoute.termCondition) :index==1? Get.toNamed(AppRoute.privacyPolicy) : index == 2 ?Get.toNamed(AppRoute.aboutUs):Get.toNamed(AppRoute.contactUsScreen) ;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.foundationColor,width: 1)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: methodName[index],
                          fontSize: 14,
                          fontWeight: FontWeight.w400,),
                        
                        const Icon(Icons.arrow_forward_ios_outlined,size: 20,)

                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

