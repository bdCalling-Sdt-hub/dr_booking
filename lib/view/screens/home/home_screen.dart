import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/utils/app_images.dart';
import 'package:dr_booking/utils/app_routes.dart';
import 'package:dr_booking/utils/app_strings.dart';
import 'package:dr_booking/view/screens/home/howit_work.dart';
import 'package:dr_booking/view/screens/home/weight_loss_options.dart';
import 'package:dr_booking/view/widgets/buttons/custom_elevated_button.dart';
import 'package:dr_booking/view/widgets/text/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/app_icons.dart';
class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    _checkDialogShown();
    super.initState();
  }

  Future<void> _checkDialogShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool dialogShown = prefs.getBool('dialogShown') ?? false;
    print("Dialog shown: $dialogShown");
    if (!dialogShown) {
      print("Showing welcome dialog");
      // Show the dialog if it hasn't been shown before
      _showWelcomeDialog();
      // Update the flag to indicate that the dialog has been shown
      prefs.setBool('dialogShown', true);
    }
  }
  _showWelcomeDialog(){
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Welcome!',style: TextStyle(color: AppColors.foundationColor),),
            content: const Text('Kwesi Ntiforo MD welcomes you to New Body New Me',style: TextStyle(color: Colors.black87),),
            actions: <Widget>[
              TextButton(
                child: const Text('Close',style: TextStyle(color: AppColors.foundationColor),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {


    return SafeArea(
    top: false,

      child: Scaffold(
         backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          // backgroundColor: AppColors.bgColor,
          toolbarHeight: 120,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: SvgPicture.asset(AppIcons.logo,color: AppColors.foundationColor,),

        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
               clipBehavior:Clip.none,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 8),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppColors.foundationColor1,
                        border: Border.all(color: AppColors.foundationColor, width: 1),
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width:120,),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             CustomText(
                               text: "Looking for medically supervised ",
                               color: AppColors.foundationGrey,
                               fontSize: 14,
                               maxLines: 2,
                               fontWeight: FontWeight.w400,
                               textAlign: TextAlign.start,
                             ),
                             CustomText(
                               textAlign: TextAlign.start,
                               bottom: 12,
                               text: "WEIGHT\nLOSS?",
                               color: AppColors.foundationGrey,
                               fontSize: 20,
                               maxLines: 2,
                               fontWeight: FontWeight.w500,
                             ),
                             CustomText(
                               bottom: 12,
                               textAlign: TextAlign.start,
                               text: AppStrings.subTitle1,
                               color: AppColors.foundationColor,
                               fontSize: 14,
                               fontWeight: FontWeight.w600,
                               maxLines: 2,
                               textOverflow: TextOverflow.ellipsis,
                             ),
                           ],
                          ),
                        ),
                        SizedBox(),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -30,
                    left: 0,
                    bottom: 0,
                    child: SizedBox(
                      child: Image.asset(
                        AppImages.bannerImage,
                        height: 170,
                        width: 120,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      onPressed: () {
                       Get.to(const HowItWorks());
                      },
                      titleSize: 12,
                      titleText: "HOW IT WORKS",
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),

                  Expanded(
                    child: CustomElevatedButton(

                      onPressed: () {
                        Get.to(WeightLossOption());
                      },
                      titleColor: AppColors.foundationColor,
                      titleSize: 12,
                      titleText: "WEIGHT LOSS OPTIONS",
                      buttonColor: AppColors.whiteColor,
                      borderColor: AppColors.foundationColor,
                      buttonRadius: 8,
                    ),
                  )

                ],
              ),
              Column(
                children: [
                  CustomElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.initialForm);
                    },
                    titleText: AppStrings.newPatient,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.preogressSreen    );
                    },
                    titleColor: AppColors.foundationColor,
                    titleText: AppStrings.existingPatient,
                    buttonColor: AppColors.whiteColor,
                    borderColor: AppColors.foundationColor,
                    buttonRadius: 8,
                  ),
                ],
              ),
              SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
