import 'dart:io';
import 'package:dr_booking/utils/app_colors.dart';
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
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/app_icons.dart';
import '../../widgets/buttons/custom_button.dart';
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
          toolbarHeight: 100,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: SvgPicture.asset(AppIcons.logo,color: AppColors.foundationColor,),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 40,bottom: 40,left: 20,right: 20),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 220,
                width: Get.width,
                decoration: const BoxDecoration(

                  image: DecorationImage(image: AssetImage("assets/images/home_page.png"),fit: BoxFit.fill),

                )
              ),
          const SizedBox(height: 12,),
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
                        Get.to(const WeightLossOption());
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
              const SizedBox(height: 12,),
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
             SizedBox(height: 12,),
             ElevatedButton(
               style: ElevatedButton.styleFrom(
                 backgroundColor: AppColors.foundationColor
               ),
                 onPressed: (){

              //   _openStore();

               showDialog(context: context, builder: (context){
                 return AlertDialog(
                   title: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       CustomButton(onTap: ()async{
                         await Share.share('https://apps.apple.com/sa/app/new-body-new-me/id6475278515');
                        Get.back();
                       },title: 'For Apple',),
                       const SizedBox(height: 16,),
                       CustomElevatedButton(
                         onPressed: () {
                           Share.share("https://play.google.com/store/apps/details?id=com.drbooking.newbodynewme");
                           Get.back();
                         },
                         titleColor: AppColors.foundationColor,
                         titleText: "For Android",
                         buttonColor: AppColors.whiteColor,
                         borderColor: AppColors.foundationColor,
                         buttonRadius: 8,
                       ),

                     ],
                   ),
                 );
               });

             }, child: const CustomText(text: "Share App",color: AppColors.whiteColor,))
            ],
          ),
        ),
      ),
    );
  }


 /* Future<void> _openStore() async {
    String packageName = 'com.residco.residpro';
    Uri appStoreUrl = Uri.parse("https://apps.apple.com/sa/app/new-body-new-me/id6475278515");
    String playStoreUrl = "https://play.google.com/store/apps/details?id=com.drbooking.newbodynewme";

    if (await canLaunchUrl(appStoreUrl) && !Platform.isAndroid) {
      await Share.share(appStoreUrl.toString());
    } else if (await canLaunchUrl(Uri.parse(playStoreUrl)) && Platform.isAndroid) {
      await Share.share(playStoreUrl);
    } else {
      throw 'Could not launch store';
    }
  }*/
}
