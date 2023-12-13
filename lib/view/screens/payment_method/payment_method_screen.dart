import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/utils/app_routes.dart';
import 'package:dr_booking/view/widgets/buttons/custom_button.dart';
import 'package:dr_booking/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {

  List<String> methodName =  ["Credit Card","Debit Card","Paypal"];
  int selectedIndex =  0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        centerTitle: true,
        title: CustomText(
          text: "Payment Method".toUpperCase(),
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
      body:  SingleChildScrollView(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "Booking fee",
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              CustomText(
                text: "\$ 300",
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ],
            ),
            const SizedBox(height: 16,),
            const CustomText(
              text: "Payment Method",
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),

           Column(
             children: List.generate(methodName.length, (index){
               return  GestureDetector(
                 onTap: (){
                   setState(() {
                       selectedIndex =  index;
                   });
                 },
                 child: Container(
                   margin: EdgeInsets.only(top: 12),
                   padding: EdgeInsets.all(16),
                   decoration: BoxDecoration(
                       color: AppColors.whiteColor,
                       borderRadius: BorderRadius.circular(8),
                       border: Border.all(color: AppColors.foundationColor,width: 1)
                   ),
                   child: Row(
                     children: [
                       Container(
                         height: 20,
                         width: 20,
                         decoration:  BoxDecoration(
                           color: selectedIndex ==index? AppColors.foundationColor:AppColors.whiteColor,
                           border: Border.all(color: AppColors.foundationColor,width: 0.5),
                           shape: BoxShape.circle,
                         ),
                       ),
                   SizedBox(width: 8,),
                    CustomText(
                     text: methodName[index],
                     fontSize: 14,
                     fontWeight: FontWeight.w400,)

                     ],
                   ),
                 ),
               );
             }),
           ),
            SizedBox(height: Get.height*0.4,),
            CustomButton(onTap: (){
               Get.toNamed(AppRoute.makePaymentScreen);
            },title: 'Proceed to payment',)
          ],
        ),
      ),
    );
  }
}
