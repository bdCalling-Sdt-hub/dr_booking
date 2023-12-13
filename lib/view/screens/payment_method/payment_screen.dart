import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/utils/app_images.dart';
import 'package:dr_booking/utils/app_routes.dart';
import 'package:dr_booking/view/widgets/bottom_nav/custom_bottom_nav_bar.dart';
import 'package:dr_booking/view/widgets/buttons/custom_button.dart';
import 'package:dr_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:dr_booking/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatelessWidget {
   PaymentScreen({super.key});
late TextEditingController day = TextEditingController();
late TextEditingController month = TextEditingController();
late TextEditingController year = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        centerTitle: true,
        title: CustomText(
          text: "Payment".toUpperCase(),
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
        padding: const EdgeInsetsDirectional.symmetric(horizontal:
        20,vertical: 24),
        child: Column(
          children: [
            CustomTextField(
              title: "Card number",
              hintText: "xxxx xxxx xxxx xxxx",
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CardNumberFormatter(),
              ],
              maxLength: 19,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              hintStyle: GoogleFonts.lato(
                  color: AppColors.foundationGrey200,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
            const SizedBox(
              height: 12,
            ),
            CustomTextField(
              title: "Expired date",
              hintText: "mm/yyyy",
              inputFormatters: [CardExpirationFormatter()],
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              maxLength: 7,
              hintStyle: GoogleFonts.lato(
                  color: AppColors.foundationGrey200,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
            const SizedBox(
              height: 12,
            ),
            CustomTextField(
              title: "CVV/CVC",
              hintText: "cvv/cvc",
              maxLength: 4,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              hintStyle: GoogleFonts.lato(
                  color: AppColors.foundationGrey200,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
            const SizedBox(
              height: 12,
            ),
            CustomTextField(
              title: "Card Holder Name",
              // textEditingController: year,
              hintText: "Enter name",
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              hintStyle: GoogleFonts.lato(
                  color: AppColors.foundationGrey200,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
            const SizedBox(
              height: 12,
            ),
            CustomTextField(
              title: "Zip code",
              hintText: "Enter your zip code",
              maxLength: 4,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              hintStyle: GoogleFonts.lato(
                  color: AppColors.foundationGrey200,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),

            const SizedBox(
              height: 12,
            ),
            CustomTextField(
              title: "Amount",
              hintText: "\$ Amount",
              inputTextStyle: const TextStyle(
              ),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              hintStyle: GoogleFonts.lato(
                  color: AppColors.foundationGrey200,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),

            SizedBox(height: Get.height*0.15,),
            CustomButton(onTap: (){
              Get.toNamed(AppRoute.makePaymentScreen);
              showDialog(context: context, builder: (context){
                return AlertDialog(

                  backgroundColor: AppColors.whiteColor,
                  title: Column(
                    children: [
                      Image.asset(AppImages.dialog_icon,height: 160,width: 160,),
                      const CustomText(text: "Appointment booked",fontWeight: FontWeight.w600,fontSize: 20,),
                      const CustomText(text: "Your booking has been\nsuccessfully done.",fontWeight: FontWeight.w400,fontSize: 16,textAlign: TextAlign.center,),

                      const SizedBox(height: 20,),
                      CustomButton(onTap: (){
                        Get.to(const CustomNavBar());
                      },title: 'Back to Home',)

                    ],
                  ),
                );
              });
            },title: 'Make payment',)
          ],
        ),
      ),
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue previousValue,
      TextEditingValue nextValue,
      ) {
    var inputText = nextValue.text;

    if (nextValue.selection.baseOffset == 0) {
      return nextValue;
    }

    var bufferString = StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }

    var string = bufferString.toString();
    return nextValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
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
      if (nonZeroIndex % 2 == 0 &&
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
