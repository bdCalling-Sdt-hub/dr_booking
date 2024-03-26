import 'package:dr_booking/sevice/api_service.dart';
import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class WeightLossOption extends StatefulWidget {
  const WeightLossOption({super.key});


  @override
  State<WeightLossOption> createState() => _AboutUsScreenState();
}
class _AboutUsScreenState extends State<WeightLossOption> {

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
 Below are few options that some of our patients have noted to be most beneficial for their weight loss efforts:

Appetite Suppressants
	1.	Bella Plus: comprises of bupropion HCL/caffeine/metformin/oxytocin/topiramate/naltrexone HCL/methylcobalamin. 65mg/250mg/100IU/15mg/8mg/1mg.
	2.	Bella Decaf: comprises of bupriopion HCL/metformin/oxytocin/topiramate/naltrexone HCL/methylcobalamin. 65mg/250mg/100IU/15mg/8mg1mg
	3.	Bella 4: comprises of bupriopoin HCL/Phentermine HCL/topiramate/naltrexone HCL/methylcobalamin. 65mg/15mg/15mg/8mg/1mg
	4.	phendimetrazine capsule
	5.	phentermine capsule

Injectables
	1.	lipo-C: comprises of methionine/choline chloride/carnithine/dexpanthenol
	2.	liraglutide/citrulline 
	3.	semaglutide/cyanocobalamin
	4.	tirzepatide/niacinamide

Please note that weight loss results may vary in individuals and at the discretion of the doctor, prescribing of any of these medications may be discontinued if patients are not realizing expected results, if there is concern about the monthly report information or if side effects are of a concern.

              
                """


            )
          ],
        ),
      )
    );
  }
}
