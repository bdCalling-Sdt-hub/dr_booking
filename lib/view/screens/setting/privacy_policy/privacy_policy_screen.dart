import 'package:dr_booking/sevice/api_service.dart';
import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/view/screens/setting/privacy_policy/privacy_controller.dart';
import 'package:dr_booking/view/screens/setting/privacy_policy/privacy_repo.dart';
import 'package:dr_booking/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  void initState() {
   Get.put(ApiService());
   Get.put(PrivacyRepo(apiService: Get.find()));
   final controller=  Get.put(PrivacyController(aboutRepo: Get.find()));
   controller.getPrivacyData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        centerTitle: true,
        title: const CustomText(
          text: "Privacy Policy for new body new me",
          maxLines: 2,
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
      body: GetBuilder<PrivacyController>(
        builder: (controller) {
          return  controller.isLoading?const Center(child: CircularProgressIndicator(color: AppColors.foundationColor,),):
          controller.privacyData.isEmpty || controller.privacyData ==null? const Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: "No Data found",textAlign: TextAlign.center,fontSize: 24,color: AppColors.foundationColor,)
              ],
            ),
          ):SingleChildScrollView(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              children: [
                CustomText(
                    textAlign: TextAlign.start,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff5C5C5C),
                    text:controller.privacyData)
              ],
            ),
          );
        }
      ),
    );
  }
}
