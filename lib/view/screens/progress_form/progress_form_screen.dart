import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/view/screens/form/initial_form2_screen.dart';
import 'package:dr_booking/view/screens/progress_form/progress_controller/progress_controller.dart';
import 'package:dr_booking/view/widgets/buttons/custom_button.dart';
import 'package:dr_booking/view/widgets/buttons/custom_elevated_loading_button.dart';
import 'package:dr_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:dr_booking/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
class ProgressFormScreen extends StatefulWidget {
  const ProgressFormScreen({super.key});

  @override
  State<ProgressFormScreen> createState() => _ProgressFormScreenState();
}

class _ProgressFormScreenState extends State<ProgressFormScreen> {
  final  _formKey = GlobalKey<FormState>();
   // bool valuefirst = false;
  @override
  Widget build(BuildContext context) {
    Get.put(ProgressController());
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
      backgroundColor: AppColors.bgColor,
      centerTitle: true,
      title: CustomText(
        text: "Progress form".toUpperCase(),
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
      body: GetBuilder<ProgressController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomTextField(title: "Name",
                    hintText: "Name",
                    textInputAction: TextInputAction.next,
                    textEditingController:controller.nameController ,
                    hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),

                    validator: (value){
                      if(value==null||value.toString().isEmpty){
                        return "The field can not be empty";
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 12,),
                  CustomTextField(title: "Email",
                    textInputAction: TextInputAction.next,
                    textEditingController:controller.emailController,
                    hintText: "Enter your Email",
                    hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
                    validator: (value){
                      if(value==null||value.toString().isEmpty){
                        return "The field can not be empty";
                      }
                      else if (!value.contains(RegExp('@'))) {
                        return "Please enter a valid email";
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 12,),
                  CustomTextField(title: "Change in pharmacy Information",
                    hintText: "Pharmacy Information",
                    textInputAction: TextInputAction.next,
                    textEditingController:controller.changePharmecyInformation ,
                    hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),

                    validator: (value){
                      if(value==null||value.toString().isEmpty){
                        return "The field can not be empty";
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 12,),
                  CustomTextField(title: "Start Weight (Ibs)",
                    hintText: "Start Weight",
                    textEditingController:controller.startWeight ,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
                    validator: (value){
                      if(value==null||value.toString().isEmpty){
                        return "The field can not be empty";
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 12,),
                  CustomTextField(title: "Current  Weight (Ibs)",
                    hintText: "Current Weight",
                    keyboardType: TextInputType.number,
                    textEditingController:controller.currentWeight ,
                    textInputAction: TextInputAction.next,
                    hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
                    validator: (value){
                      if(value==null||value.toString().isEmpty){
                        return "The field can not be empty";
                      }
                      else{
                        return null;
                      }
                    },
                  ),

                  const SizedBox(height: 12,),
                  CustomTextField(title: "Goal Weight (Ibs)",
                    hintText: "Goal Weight",
                    keyboardType: TextInputType.number,
                    textEditingController:controller.goalWeight,
                    textInputAction: TextInputAction.next,
                    hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
                    validator: (value){
                      if(value==null||value.toString().isEmpty){
                        return "The field can not be empty";
                      }
                      else{
                        return null;
                      }
                    },
                  ),

                  const SizedBox(height: 12,),
                  CustomTextField(title: "Blood Pressure",
                    hintText: "120/80",
                    maxLength: 6,
                    textEditingController:controller.bloodPressure ,
                    inputFormatters: [CardExpirationFormatter()],
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
                    validator: (value){
                      if(value==null||value.toString().isEmpty){
                        return "The field can not be empty";
                      }
                      else{
                        return null;
                      }
                    },
                  ),

                  const SizedBox(height: 12,),
                  CustomTextField(title: "List all other prescribed medications",
                    hintText: "Type Here",
                    keyboardType: TextInputType.text,
                    textEditingController:controller.otherPrescribedMedication ,
                    textInputAction: TextInputAction.next,
                    hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
                    validator: (value){
                      if(value==null||value.toString().isEmpty){
                        return "The field can not be empty";
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 12,),
                  CustomTextField(title: "Do you want a refill for your medication?",
                    hintText: "Yes or No",
                    textInputAction: TextInputAction.next,
                    textEditingController:controller.refill,
                    hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
                    validator: (value){
                      if(value==null||value.toString().isEmpty){
                        return "The field can not be empty";
                      }
                      else{
                        return null;
                      }
                    },

                  ),
                  const SizedBox(height: 12,),
                  CustomTextField(title: "Are you experiencing any of these symptoms with your weight loss medications? Check all that apply",
                    hintText: "Type Here",
                    textEditingController:controller.symptomsWithWeightLossMedication ,
                    textInputAction: TextInputAction.next,
                    hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
                    validator: (value){
                      if(value==null||value.toString().isEmpty){
                        return "The field can not be empty";
                      }
                      else{
                        return null;
                      }
                    },
                  ),

                  const SizedBox(height: 12,),
                  CustomTextField(title: "Any message for the Doctor",
                    hintText: "Write Something Here",
                    textEditingController:controller.knowledge ,
                    textInputAction: TextInputAction.next,
                    hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
                    validator: (value){
                      if(value==null||value.toString().isEmpty){
                        return "The field can not be empty";
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 12,),
                  CustomTextField(title: "Please enter new pharmacy name and address if there has been a change in your pharmacy information",
                    hintText: "Type Here",
                    textInputAction: TextInputAction.next,
                    textEditingController:controller.enterThePharmacyName ,
                    hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),),
                  const SizedBox(height: 12,),
                  CustomTextField(title: "When can we contact you?",
                    hintText: "Date and time if you want a call back from me",
                    keyboardType: TextInputType.text,
                    // inputFormatters: [
                    //   TimeTextInputFormatter(hourMaxValue:24, minuteMaxValue: 59 )
                    // ],
                    textEditingController:controller.prefarableTime ,
                    hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 12,),
                    validator: (value){
                      if(value==null||value.toString().isEmpty){
                        return "The field can not be empty";
                      }
                      // else if(value.length<5){
                      //   return "Time Format 00:00";
                      // }

                      else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    children: [

                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: AppColors.foundationColor,
                        value: controller.checkBox,
                        onChanged: (bool? value) {
                          setState(() {
                            controller.checkBox = value!;
                          });
                        },
                      ),
                      const Flexible(
                        child: CustomText(text: "I confirm all information filled in this form to be accurate and not misleading  in any way",
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          textOverflow: TextOverflow.ellipsis,
                          color: AppColors.foundationGrey,fontSize: 16,fontWeight: FontWeight.w400,),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12,),

                  CustomTextField(title: "Name",
                    hintText: "Enter Your Name",
                    textInputAction: TextInputAction.done,
                    textEditingController: controller.signature,
                    maxLines: 1,
                    hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),

                    validator: (value){
                      if(value==null||value.toString().isEmpty){
                        return "The field can not be empty";
                      }
                      else{
                        return null;
                      }
                    },

                  ),

                  const SizedBox(height: 40,),
                controller.isLoading ? const CustomElevatedLoadingButton() : CustomButton(onTap: (){

                    if(_formKey.currentState!.validate()){

                      if(controller.checkBox){
                         controller.sendProgressData();
                      }
                      else{
                        Get.snackbar("Alert", "if all information is correct and true,Please check upper the button",
                        backgroundColor: Colors.redAccent,colorText: AppColors.whiteColor,duration: const Duration(seconds: 15));
                      }
                    }
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

class CardExpirationFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newValueString = newValue.text;
    String valueToReturn = '';

    for (int i = 0; i < newValueString.length; i++) {
      if (newValueString[i] != '/') valueToReturn += newValueString[i];
      var nonZeroIndex = i + 1;
      final contains = valueToReturn.contains(RegExp(r'\/'));
      if (nonZeroIndex % 3 == 0 &&
          nonZeroIndex != newValueString.length &&
          !(contains)) {
        valueToReturn += '/';
      }
    }
    return newValue.copyWith(
      text: valueToReturn,
      selection: TextSelection.fromPosition(
        TextPosition(offset: valueToReturn.length),
      ),
    );
  }
}

