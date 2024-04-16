import 'package:dr_booking/utils/app_colors.dart';


import 'package:dr_booking/view/widgets/text/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  List<String> methodName =  ["Terms & Condition for New Body New Me","Privacy Policy for New Body New Me","About for New Body New Me","Contact Us"," Share App"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          toolbarHeight: 100,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.bgColor,
          centerTitle: true,
          title: const CustomText(
            text: "Terms & Condition for New Body New Me",
            fontSize: 18,
            maxLines: 3,
            fontWeight: FontWeight.w500,
          ),
        ),
        body:  SfPdfViewer.asset(
            "assets/images/Terms-and-Conditions.pdf")
      )
    );
  }
}




/*
SingleChildScrollView(
padding:  const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 24),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Column(
children: List.generate(methodName.length, (index){
return  GestureDetector(
onTap: (){
setState(() {
index == 0 ? Get.toNamed(AppRoute.termCondition) :index==1? Get.toNamed(AppRoute.privacyPolicy) : index == 2 ?Get.toNamed(AppRoute.aboutUs): index == 3? Get.toNamed(AppRoute.contactUsScreen) : Get.toNamed(AppRoute.shareScreen) ;
});
},
child: Container(
margin: const EdgeInsets.only(top: 12),
padding: const EdgeInsets.all(16),
decoration: BoxDecoration(
color: AppColors.whiteColor,
borderRadius: BorderRadius.circular(8),
border: Border.all(color: AppColors.foundationColor,width: 1)
),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Flexible(
child: CustomText(
text: methodName[index],
textOverflow: TextOverflow.ellipsis,
fontSize: 14,
fontWeight: FontWeight.w400,),
),

const Icon(Icons.arrow_forward_ios_outlined,size: 20,)

],
),
),
);
}),
),
],
),
)
*/
