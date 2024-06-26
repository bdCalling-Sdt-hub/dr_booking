import 'package:dr_booking/core/global/api_url_container.dart';
import 'package:dr_booking/sevice/api_service.dart';
import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/view/screens/about_dr/controller.dart';
import 'package:dr_booking/view/screens/about_dr/repo.dart';
import 'package:dr_booking/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AboutDrScreen extends StatefulWidget {
  const AboutDrScreen({super.key});



  @override
  State<AboutDrScreen> createState() => _AboutDrScreenState();
}

class _AboutDrScreenState extends State<AboutDrScreen> {
  // @override
  // void initState() {
  //   Get.put(ApiService());
  //   Get.put(AboutRepo(apiService: Get.find()));
  //   final controller = Get.put(AboutController(aboutRepo: Get.find()));
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     controller.aboutdrData();
  //   });
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.bgColor,
          centerTitle: true,
          title: const CustomText(
            text: "Online medically supervised weight loss clinic",
            fontSize: 18,
            maxLines: 2,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: SfPdfViewer.asset(
            "assets/images/Online medically supervised weight loss clinic.pdf")



        /*GetBuilder<AboutController>(builder: (controller) {
          return controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.foundationColor,
                  ),
                )
              : controller.aboutDr.isEmpty || controller.aboutDr ==null? const Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: "No Data found",textAlign: TextAlign.center,fontSize: 24,color: AppColors.foundationColor,)
              ],
            ),
          ):SingleChildScrollView(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 20, vertical: 24),
                  child: Column(
                    children: [
                      controller.image.isEmpty
                          ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.foundationColor,
                        ),
                      ): Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                            image:  DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage("${ApiUrlContainer.imageBaseUrl}${controller.image?? ""}")
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
        })*/,
      ),
    );
  }
}



