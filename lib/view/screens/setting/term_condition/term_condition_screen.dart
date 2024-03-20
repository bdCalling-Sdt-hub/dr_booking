import 'package:dr_booking/sevice/api_service.dart';
import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/view/screens/setting/term_condition/term_condition_repo.dart';
import 'package:dr_booking/view/screens/setting/term_condition/termcondition_controller.dart';
import 'package:dr_booking/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TemrConditionsScreen extends StatefulWidget {
  const TemrConditionsScreen({super.key});

  @override
  State<TemrConditionsScreen> createState() => _TemrConditionsScreenState();
}

class _TemrConditionsScreenState extends State<TemrConditionsScreen> {
  @override
  void initState() {
    Get.put(ApiService());
    Get.put(TermConditionRepo(apiService: Get.find()));
    final controller =
        Get.put(TermConditionController(termConditionRepo: Get.find()));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.termConditionData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        centerTitle: true,
        title: CustomText(
          text: "Terms & Conditions".toUpperCase(),
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
      body: GetBuilder<TermConditionController>(builder: (controller) {
        return  controller.isLoading?const Center(child: CircularProgressIndicator(color: AppColors.foundationColor,),): controller.termCondition.isEmpty || controller.termCondition ==null? const Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text: "No Data found",textAlign: TextAlign.center,fontSize: 24,color: AppColors.foundationColor,)
            ],
          ),
        ):SingleChildScrollView(
          padding:
              const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: [
              CustomText(
                  textAlign: TextAlign.start,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff5C5C5C),
                  text:controller.termCondition)
            ],
          ),
        );
      }),
    );
  }
}
