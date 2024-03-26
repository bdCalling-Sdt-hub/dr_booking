import 'package:dr_booking/sevice/api_service.dart';
import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



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
            text: "WEIGHT LOSS OPTIONS",
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
          padding: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 24),
          child:  Column(
            children: [
              CustomText(
                  textAlign: TextAlign.start,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff5C5C5C),
                  text:"""
For new patients, download the “New Body New Me” app from the apple app store or the google play store (for android phone users) & from the app you can do the following:

	1.	FILL OUT A NEW PATIENT FORM
	2.	INCLUDE A DATE AND TIME WHEN YOU WILL BE AVAILABLE FOR A ZOOM CONSULTATION
	3.	EXPECT YOUR MEDICATIONS SENT TO YOU FROM THE PHARMACY
	4.	FILL OUT MONTHLY EXISTING PATIENT REPORT
	5.	REQUEST PERIODIC FOLLOW UP CONSULTATION FROM THE DOCTOR

After a new patient request form is received, please expect a response via email within 24 – 48 hours which will confirm your online consultation/zoom appointment.  This email will also address the consultation fee.  Patients who continue to require our services either monthly or every other month will be required to pay a follow up consultation fee per consultation.  “New Body New Me” does not bind patients to subscriptions or contracts for our service.

              
                """


              )
            ],
          ),
        )
    );
  }
}
