import 'package:dr_booking/core/global/api_url_container.dart';
import 'package:dr_booking/sevice/api_service.dart';
import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/view/screens/about_dr/controller.dart';
import 'package:dr_booking/view/screens/about_dr/repo.dart';
import 'package:dr_booking/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class AboutDrScreen extends StatefulWidget {
  const AboutDrScreen({super.key});

  @override
  State<AboutDrScreen> createState() => _AboutDrScreenState();
}

class _AboutDrScreenState extends State<AboutDrScreen> {
  @override
  void initState() {
    Get.put(ApiService());
    Get.put(AboutRepo(apiService: Get.find()));
    final controller = Get.put(AboutController(aboutRepo: Get.find()));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.aboutdrData();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.bgColor,
          centerTitle: true,
          title: CustomText(
            text: "About New Body New Me".toUpperCase(),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: GetBuilder<AboutController>(builder: (controller) {
          return controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.foundationColor,
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 20, vertical: 24),
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                            image:  DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage("${ApiUrlContainer.imageBaseUrl}${controller.aboutModel.data?.image ?? ""}")
                            )
                        ),
                      ),
                      const SizedBox(height: 24,),
                      CustomText(
                          textAlign: TextAlign.start,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff5C5C5C),
                          text: controller.aboutDr),

                    ],
                  ),
                );
        }),
      ),
    );
  }
}



