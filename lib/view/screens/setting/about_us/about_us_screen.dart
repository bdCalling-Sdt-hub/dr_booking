import 'package:dr_booking/sevice/api_service.dart';
import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'about_us_controller.dart';
import 'about_us_repo.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});


  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}
class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  void initState() {
    Get.put(ApiService());
    Get.put(AboutUsRepo(apiService: Get.find()));
    final controller = Get.put(AboutUsController(aboutRepo: Get.find()));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.aboutUs();
    });
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
          text: "About for new body new me ",
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
      body: GetBuilder<AboutUsController>(builder: (controller) {
        return  controller.isLoading?const Center(child: CircularProgressIndicator(color: AppColors.foundationColor,),)

            :controller.about.isEmpty || controller.about ==null? const Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text: "No Data found",textAlign: TextAlign.center,fontSize: 24,color: AppColors.foundationColor,)
            ],
          ),
        ):

        SingleChildScrollView(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 24),
          child:  Column(
            children: [
             CustomText(
                  textAlign: TextAlign.start,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff5C5C5C),
                  text: controller.about)
              ],
          ),
        );
      }),
    );
  }
}
