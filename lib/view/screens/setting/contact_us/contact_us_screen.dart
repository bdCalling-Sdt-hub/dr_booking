import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/utils/app_routes.dart';
import 'package:dr_booking/view/screens/setting/contact_us/contact_us_controller.dart';
import 'package:dr_booking/view/widgets/buttons/custom_button.dart';
import 'package:dr_booking/view/widgets/buttons/custom_elevated_loading_button.dart';
import 'package:dr_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:dr_booking/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactUsScreen extends StatelessWidget {
   ContactUsScreen({super.key});

   final  _formKey = GlobalKey<FormState>();

  // final  controller =  Get.put(ContactUsController());
  @override
  Widget build(BuildContext context) {
    Get.put(ContactUsController());
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.bgColor,
        centerTitle: true,
        title: CustomText(
          text: "Contact Us".toUpperCase(),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        leading: IconButton(onPressed: ()=>Get.back() ,icon: const Icon(Icons.arrow_back_ios_new,size: 24,color: AppColors.foundationGrey,) ,),
      ),
      body: GetBuilder<ContactUsController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 24),
            child: Column(
              children: [
                const CustomText(
                  text: "Contact New Body New Me",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                CustomTextField(title: "Name",
                  textEditingController: controller.nameController,
                  hintText: "Your Name",
                  textInputAction: TextInputAction.next,
                  hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
                ),

                const SizedBox(height: 12,),

                CustomTextField(title: "Email",
                  hintText: "Your Email",
                  textInputAction: TextInputAction.next,
                  textEditingController: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
                ),

                const SizedBox(height: 12,),

                CustomTextField(title: "Subject",
                  hintText: "Write subject",
                  textEditingController: controller.subjectController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,

                  maxLines: 3,
                  hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
                ),

                const SizedBox(height: 12,),

                CustomTextField(title: "Your message",
                  textEditingController: controller.messageController,
                  hintText: "Enter Your message",
                  maxLines: 3,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
                ),

                const SizedBox(height: 24,),

                 controller.isLoading ? const CustomElevatedLoadingButton(): CustomButton(onTap: (){
                  controller.sendContactInfo();
                },title: 'Send',),
                const SizedBox(height: 50,),
                const CustomText(text: "You may also contact us at",color: AppColors.foundationGrey,fontSize: 16,fontWeight: FontWeight.w400,),
                const SizedBox(height: 8,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.mail,color: AppColors.foundationColor,size: 24,),
                    SizedBox(width: 8,),
                    CustomText(text: "example@gmail.com",color: AppColors.foundationColor,fontSize: 16,fontWeight: FontWeight.w400,),
                  ],
                )
              ],

            )
          );
        }
      ),
    );
  }
}
