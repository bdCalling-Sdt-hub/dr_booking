import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/utils/app_routes.dart';
import 'package:dr_booking/view/widgets/buttons/custom_button.dart';
import 'package:dr_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:dr_booking/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
class ProgressFormScreen extends StatefulWidget {
  const ProgressFormScreen({super.key});

  @override
  State<ProgressFormScreen> createState() => _ProgressFormScreenState();
}

class _ProgressFormScreenState extends State<ProgressFormScreen> {
  bool valuefirst = false;
  @override
  Widget build(BuildContext context) {

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
      body: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomTextField(title: "Name",
              hintText: "Name",
              hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
            ),
            const SizedBox(height: 12,),
            CustomTextField(title: "Change in pharmacy Information",
              hintText: "Pharmacy Information",
              hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
            ),
            const SizedBox(height: 12,),
            CustomTextField(title: "Start Weight (Ibs)",
              hintText: "start weight",
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
            ),
            const SizedBox(height: 12,),
            CustomTextField(title: "Current  Weight (Ibs)",
              hintText: "Current weight",
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
            ),

            const SizedBox(height: 12,),
            CustomTextField(title: "Goal Weight (Ibs)",
              hintText: "Goal Weight",
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
            ),

            const SizedBox(height: 12,),
            CustomTextField(title: "Blood Pressure",
              hintText: "120/80",
              maxLength: 6,
              inputFormatters: [CardExpirationFormatter()],
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
            ),

            const SizedBox(height: 12,),
            CustomTextField(title: "List all other prescribed medications (if any)",
              hintText: "Type Here",

              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
            ),


            const SizedBox(height: 12,),
            CustomTextField(title: "Do you want a refill for your medication?",
              hintText: "Yes or No",
              textInputAction: TextInputAction.next,
              hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
            ),

            const SizedBox(height: 12,),
            CustomTextField(title: "Are you experiencing any of these symptoms with your weight loss medications? Check all that apply",
              hintText: "Type Here",
              textInputAction: TextInputAction.next,
              hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),),

            const SizedBox(height: 12,),
            CustomTextField(title: "Please enter new pharmacy name and address if there has been a change in your pharmacy information",
              hintText: "Type Here",
              textInputAction: TextInputAction.next,
              hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),),

            const SizedBox(height: 12,),
            CustomTextField(title: "Are you experiencing any of these symptoms with your weight loss medications? Check all that apply",
              hintText: "Type Here",
              textInputAction: TextInputAction.next,
              hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),),
            const SizedBox(height: 12,),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: AppColors.foundationColor,
                  value: this.valuefirst,
                  onChanged: (bool? value) {
                    setState(() {
                      this.valuefirst = value!;
                    });
                  },
                ),
                const Flexible(
                  child: CustomText(text: "This information is current and true to the\nbest of my knowledge.",
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    textOverflow: TextOverflow.ellipsis,
                    color: AppColors.foundationGrey,fontSize: 16,fontWeight: FontWeight.w400,),
                ),
              ],
            ),
            const SizedBox(height: 12,),

            CustomTextField(title: "Name",
              hintText: "Enter Your Name",
              textInputAction: TextInputAction.done,
              maxLines: 1,
              hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
            ),

          /* const CustomText(text: "Signature Below",textAlign: TextAlign.start,fontWeight: FontWeight.w500,fontSize: 14,),
            const SizedBox(height: 8,),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.foundationGreen100,width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              child:  const SfSignaturePad(
                minimumStrokeWidth: 1,
                maximumStrokeWidth: 3,
                strokeColor: Colors.black87,
                backgroundColor: Colors.white,
              ),
            ),*/
            const SizedBox(height: 40,),

            CustomButton(onTap: (){
               Get.toNamed(AppRoute.paymentScreen);
            },title: 'Continue',)
          ],
        ),
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

