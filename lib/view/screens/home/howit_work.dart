import 'package:dr_booking/sevice/api_service.dart';
import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';



class HowItWorks extends StatefulWidget {
  const HowItWorks({super.key});


  @override
  State<HowItWorks> createState() => _AboutUsScreenState();
}
class _AboutUsScreenState extends State<HowItWorks> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          backgroundColor: AppColors.bgColor,
          centerTitle: true,
          title: const CustomText(
            text: "HOW IT WORKS",
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
        body:
        SfPdfViewer.asset(
            "assets/images/How-It-Works updated.pdf")
    );
  }
}
