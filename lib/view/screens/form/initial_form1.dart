import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/utils/app_images.dart';
import 'package:dr_booking/utils/app_routes.dart';
import 'package:dr_booking/view/screens/form/intake_form_controller/intake_form_controller.dart';
import 'package:dr_booking/view/widgets/buttons/custom_button.dart';
import 'package:dr_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:dr_booking/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InitialForm1Screen extends StatefulWidget {
  const InitialForm1Screen({super.key});

  @override
  State<InitialForm1Screen> createState() => _InitialForm1ScreenState();
}

class _InitialForm1ScreenState extends State<InitialForm1Screen> {


  @override
  Widget build(BuildContext context) {
    Get.put(IntakeFormController());
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        centerTitle: true,
        title: CustomText(
          text: "InTake form".toUpperCase(),
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
      body:  GetBuilder<IntakeFormController>(
        builder: (controller) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsetsDirectional.symmetric(vertical: 24,horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(title: "Name",
                textEditingController: controller.nameController,
                hintText: "Name",
                  hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
                ),
                const SizedBox(height: 12,),
                CustomTextField(title: "Date of Birth",

                hintText: "yyyy/mm/dd",
                  suffixIcon:  Icon(Icons.calendar_month_rounded,size: 24,color: AppColors.foundationColor,),
                  hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
                  textEditingController: controller.dobController,
                  onTap: (){
                    controller.dateofbirthPicker(context);
                  },
                  cursorColor: AppColors.foundationColor,
                ),
                const SizedBox(height: 12,),
                CustomTextField(title: "Address",
                  textEditingController: controller.addressController,
                maxLines: 3,
                hintText: "Enter full address",
                  hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
                ),
                const SizedBox(height: 12,),

                const CustomText(text: "Phone Number",color: AppColors.foundationGrey,fontSize: 14,fontWeight: FontWeight.w500 ,),
                const SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.foundationGreen100
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.whiteColor,
                        ),
                        child: Row(
                          children: [
                            Image.asset(AppImages.flag,height: 40,width: 40,),
                            const SizedBox(width: 10),
                            Text(
                              "+1",
                              style: GoogleFonts.lato(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.foundationGrey
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controller.phoneNumberController,
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.whiteColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: AppColors.foundationGreen100),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: AppColors.foundationGreen100),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: AppColors.foundationGreen100,)
                          ),
                          hintText: "Phone Number".tr,
                          hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
                        ),
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 12,),
                CustomTextField(title: "Email",
                 textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  textEditingController: controller.emailController,
                  hintText: "Enter your Email",
                  hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
                ),
                const SizedBox(height: 40,),

                CustomButton(onTap: (){
                  Get.toNamed(AppRoute.initialForm2);
                }, title: "Continue")
              ],
            ),
          );
        }
      ),
    );
  }
}
