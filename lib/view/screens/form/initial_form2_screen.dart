

import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/utils/app_routes.dart';
import 'package:dr_booking/view/screens/form/intake_form_controller/intake_form_controller.dart';
import 'package:dr_booking/view/widgets/buttons/custom_button.dart';
import 'package:dr_booking/view/widgets/buttons/custom_elevated_loading_button.dart';
import 'package:dr_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:dr_booking/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class InitialForm2Screen extends StatefulWidget {
  const InitialForm2Screen({super.key, /*required this.contactRefers, required this.mailAddWithUser*/});

/*  final String contactRefers;
  final  String mailAddWithUser;*/

  @override
  State<InitialForm2Screen> createState() => _InitialForm2ScreenState();
}

class _InitialForm2ScreenState extends State<InitialForm2Screen> {


  final  intakeFormController = Get.put(IntakeFormController());
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    // Get.put(IntakeFormController());
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
            )
        ),
      ),
      body:  GetBuilder<IntakeFormController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 24),
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text: "What forms of contact may we contact you?",
                  color: AppColors.foundationGrey,fontSize: 16,fontWeight: FontWeight.w500,),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: List.generate(controller.contactby.length, (index){
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              controller.selectedcategory = index;
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 12),
                                height : 20,
                                width: 20,
                                decoration:  BoxDecoration(
                                  color:controller.selectedcategory == index? AppColors.foundationColor: AppColors.whiteColor,
                                  shape: BoxShape.circle,
                                  border: Border.all (color:controller.selectedcategory == index? AppColors.foundationColor: AppColors.foundationGrey,width: 2),
                                ),
                              /*  child: controller.selectedcategory == index ? const Center(child: Align(
                                    alignment: Alignment.center,
                                    child: Icon(Icons.check_outlined,size: 18,color: AppColors.whiteColor ,))) : const SizedBox(),*/
                              ),
                              const SizedBox(width: 12,),
                              CustomText(top:12,text: controller.contactby[index],color: AppColors.foundationGrey,fontSize: 16,fontWeight: FontWeight.w400,),

                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                  const CustomText(text: "Would you like to be added to our mailing list?",
                    color: AppColors.foundationGrey,fontSize: 16,fontWeight: FontWeight.w500,),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: List.generate(controller.mailAddWithUser.length, (index){
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              controller.selectedIndex = index;
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                               margin: const EdgeInsets.only(top: 12),
                                height : 20,
                                width: 20,
                                decoration:  BoxDecoration(
                                  color:controller.selectedIndex == index? AppColors.foundationColor: AppColors.whiteColor,
                                  shape: BoxShape.circle,
                                  border: Border.all (color:controller.selectedIndex == index? AppColors.foundationColor: AppColors.foundationGrey,width: 2),
                                ),
                              ),
                               const SizedBox(width: 12,),
                               CustomText(top:12,text: controller.mailAddWithUser[index],color: AppColors.foundationGrey,fontSize: 16,fontWeight: FontWeight.w400,),

                            ],
                          ),
                        );
                      }),
                    ),
                  ),

                  CustomTextField(title: "Occupation",
                    hintText: "Enter your occupation",
                    textEditingController: controller.occupationController,
                    hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
                    validator: (value){
                      if(value==null||value.toString().isEmpty){
                        return "The field can not be empty";
                      }

                      else if(value.length<5){
                        return "Please give minimum 5 character";
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 12,),
                  CustomTextField(title: "Reason for visit",
                    hintText: "Enter reason here",
                    maxLines: 3,
                    textEditingController: controller.reasonVisitController,
                    hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
                    validator: (value){
                      if(value==null||value.toString().isEmpty){
                        return "The field can not be empty";
                      }

                      else if(value.length<5){
                        return "Please give minimum 5 character";
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 12,),
                  CustomTextField(title: "Allergies",
                    textEditingController: controller.allergiesdesriptionController,
                    hintText: "Describe if you have allergy problems",
                    maxLines: 3,
                    hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
                    validator: (value){
                      if(value==null||value.toString().isEmpty){
                        return "The field can not be empty";
                      }
                      else if(value.length<5){
                        return "Please give minimum 5 character";
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 12,),
                  CustomTextField(title: "Present Medications",
                    hintText: "Describe your present medications (if any)",
                    textEditingController: controller.presentMedicationController,
                    maxLines: 3,
                    hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),

                    validator: (value){
                      if(value==null||value.toString().isEmpty){
                        return "The field can not be empty";
                      }
                      else if(value.length<5){
                        return "Please give minimum 5 character";
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 12,),
                  CustomTextField(title: "Preferable time",
                    textInputAction: TextInputAction.done,
                    inputFormatters: [
                      TimeTextInputFormatter(hourMaxValue:24, minuteMaxValue: 59 )
                    ],
                    textEditingController: controller.prefareableTimeController,
                    hintText: "Enter your preferable time (if any)",
                    hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
                    validator: (value){
                      if(value==null||value.toString().isEmpty){
                        return "The field can not be empty";
                      }

                      else if(value.length<5){
                        return "input 00:00";
                      }
                      else{
                        return null;
                      }
                    },
                  ),
              const SizedBox(height: 40,),

             controller.isLoading?const CustomElevatedLoadingButton() : CustomButton(onTap: (){
                if(_formKey.currentState!.validate()){
                  controller.sendIntakeFormData();
                }

                /*else if(intakeFormController.selectedcategory== -1 || controller.contactby.isEmpty){
                  print("=========================================>ahjshdfhdhhhjdhjhd");

                  // Get.snackbar("Alert", "Please select contact");
                }*/

              },title: 'Continue',)
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}


class TimeTextInputFormatter extends TextInputFormatter {
  TimeTextInputFormatter(
      {required this.hourMaxValue, required this.minuteMaxValue}) {
     _exp = RegExp(r'^$|[0-9:]+$');
  }
  late RegExp _exp;

  final int hourMaxValue;
  final int minuteMaxValue;
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (_exp.hasMatch(newValue.text)) {
      TextSelection newSelection = newValue.selection;

      final String value = newValue.text;
      String newText;

      String leftChunk = '';
      String rightChunk = '';

      if (value.length > 1 &&
          (int.tryParse(value.substring(0, 2)) ?? 0) == hourMaxValue)
        //this logic is to restrict value more than max hour
          {
        if (oldValue.text.contains(':')) {
          leftChunk = value.substring(0, 1);
        } else {
          leftChunk = '${value.substring(0, 2)}:';
          rightChunk = '00';
        }
      } else if (value.length > 5) {
        //this logic is to not allow more value
        leftChunk = oldValue.text;
      } else if (value.length == 5) {
        if ((int.tryParse(value.substring(3)) ?? 0) > minuteMaxValue) {
          //this logic is to restrict value more than max minute
          leftChunk = oldValue.text;
        } else {
          leftChunk = value;
        }
      } else if (value.length == 2) {
        if (oldValue.text.contains(':')) {
          //this logic is to delete : & value before : ,when backspacing
          leftChunk = value.substring(0, 1);
        } else {
          if ((int.tryParse(value) ?? 0) > hourMaxValue) {
            //this logic is to restrict value more than max hour
            leftChunk = oldValue.text;
          } else {
            //this logic is to add : with second letter
            leftChunk = '${value.substring(0, 2)}:';
            rightChunk = value.substring(2);
          }
        }
      } else {
        leftChunk = value;
      }
      newText = leftChunk + rightChunk;

      newSelection = newValue.selection.copyWith(
        baseOffset: math.min(newText.length, newText.length),
        extentOffset: math.min(newText.length, newText.length),
      );

      return TextEditingValue(
        text: newText,
        selection: newSelection,
      ); }
    return oldValue;
  }
}