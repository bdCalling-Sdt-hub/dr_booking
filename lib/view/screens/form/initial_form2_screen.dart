import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/utils/app_routes.dart';
import 'package:dr_booking/view/widgets/buttons/custom_button.dart';
import 'package:dr_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:dr_booking/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class InitialForm2Screen extends StatefulWidget {
  const InitialForm2Screen({super.key});

  @override
  State<InitialForm2Screen> createState() => _InitialForm2ScreenState();
}

class _InitialForm2ScreenState extends State<InitialForm2Screen> {
  bool valuefirst = false;
  bool valuesecond = false;
  bool valuefirst1 = false;
  bool valuesecond1= false;
  int selected =  0;

  List mailing =  ["Yes","Not a this time"];
  @override
  Widget build(BuildContext context) {
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
      body:  SingleChildScrollView(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 24),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(text: "What forms of contact may we contact you?",
            color: AppColors.foundationGrey,fontSize: 16,fontWeight: FontWeight.w500,),
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
                const CustomText(text: "Your cell number",color: AppColors.foundationGrey,fontSize: 16,fontWeight: FontWeight.w400,),
              ],
            ),

            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: AppColors.foundationColor,
                  value: this.valuesecond,
                  onChanged: (bool? value) {
                    setState(() {
                      this.valuesecond = value!;
                    });
                  },
                ),
                const CustomText(text: "Email",color: AppColors.foundationGrey,fontSize: 16,fontWeight: FontWeight.w400,),
              ],
            ),


            const CustomText(text: "Would you like to be added to our mailing list?",
              color: AppColors.foundationGrey,fontSize: 16,fontWeight: FontWeight.w500,),



            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: List.generate(mailing.length, (index){
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        selected = index;
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                         margin: const EdgeInsets.only(top: 12),
                          height : 20,
                          width: 20,
                          decoration:  BoxDecoration(
                            color:selected == index? AppColors.foundationColor: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all (color:selected == index? AppColors.foundationColor: AppColors.foundationGrey,width: 2),

                          ),
                          child: selected == index ? const Center(child: Align(
                              alignment: Alignment.center,
                              child: Icon(Icons.check_outlined,size: 18,color: AppColors.whiteColor ,))) : const SizedBox(),
                        ),
                         const SizedBox(width: 12,),
                         CustomText(top:12,text: mailing[index],color: AppColors.foundationGrey,fontSize: 16,fontWeight: FontWeight.w400,),

                      ],
                    ),
                  );
                }),
              ),
            ),

            CustomTextField(title: "Occupation",
              hintText: "Enter your occupation",
              hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
            ),
            const SizedBox(height: 12,),
            CustomTextField(title: "Reason for visit",
              hintText: "Enter reason here",
              maxLines: 3,
              hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
            ),

            const SizedBox(height: 12,),
            CustomTextField(title: "Present Medications",
              hintText: "Describe your present medications (if any)",
              maxLines: 3,
              hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
            ),
            const SizedBox(height: 12,),
            CustomTextField(title: "Prefarable time",
              hintText: "Enter your prefarable time (if any)",
              hintStyle: GoogleFonts.lato(color: AppColors.foundationGrey200,fontWeight: FontWeight.w400,fontSize: 14),
            ),
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
