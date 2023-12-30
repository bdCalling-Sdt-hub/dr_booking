import 'dart:convert';
import 'package:dr_booking/core/global/api_url_container.dart';
import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/view/widgets/bottom_nav/custom_bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class ProgressController extends GetxController{

  TextEditingController nameController =  TextEditingController();
  TextEditingController changePharmecyInformation =  TextEditingController();
  TextEditingController startWeight =  TextEditingController();
  TextEditingController currentWeight =  TextEditingController();
  TextEditingController emailController =  TextEditingController();
  TextEditingController goalWeight =  TextEditingController();
  TextEditingController bloodPressure =  TextEditingController();
  TextEditingController otherPrescribedMedication =  TextEditingController();
  TextEditingController refill =  TextEditingController();
  TextEditingController enterThePharmacyName =  TextEditingController();
  TextEditingController symptomsWithWeightLossMedication =  TextEditingController();
  TextEditingController prefarableTime =  TextEditingController();
  TextEditingController knowledge =  TextEditingController();
  TextEditingController signature =  TextEditingController();

    bool checkBox =  false;


  bool isLoading = false;
  sendProgressData() async {
    isLoading = true;
    update();
    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.progressEndPondEnd}";
    var request = http.MultipartRequest('POST', Uri.parse(uri),);

    Map<String, String> body = {
      'name': nameController.text,
      'email': emailController.text,
      'changePharmecyInformation': changePharmecyInformation.text,
      'startWeight': startWeight.text,
      'currentWeight': currentWeight.text,
      'goalWeight': goalWeight.text,
      'bloodPressure': bloodPressure.text,
      'otherPrescribedMedication': otherPrescribedMedication.text,
      'refill': refill.text,
      'symptomsWithWeightLossMedication': symptomsWithWeightLossMedication.text,
      'enterThePharmacyName': enterThePharmacyName.text,
      'prefarableTime': prefarableTime.text,
      'knowledge': knowledge.text,
      'checkBox': checkBox.toString(),
      'signature': signature.text,
    };
    request.fields.addAll(body);

    var response = await request.send();

    String responseBody = await response.stream.bytesToString();

    // Parse the JSON string
    Map<String, dynamic> parsedResponse = jsonDecode(responseBody);

    // Access the "message" field
    String message = parsedResponse['message'];

    if(response.statusCode==200){
      removeData();
      debugPrint("============> Response : $responseBody");
      Get.snackbar("Success",message.toString(),backgroundColor: AppColors.foundationColor,duration: const Duration(seconds: 10),colorText: Colors.white,);
      Get.to(const CustomNavBar());
    }
    else{
      Get.snackbar("Alert",message.toString(),backgroundColor: Colors.redAccent,duration: const Duration(seconds: 15),colorText: AppColors.whiteColor);
      errorClear();
    }
    isLoading = false;
    update();
  }
  errorClear (){
    emailController.text="";
  }
  removeData(){
    nameController.text ="";
    emailController.text="";
    changePharmecyInformation.text = '';
    startWeight.text = "";
    currentWeight.text = "";
    goalWeight.text = "";
    bloodPressure.text = "";
    otherPrescribedMedication.text = "";
    refill.text = "";
    symptomsWithWeightLossMedication.text = "";
    knowledge.text = "";
    signature.text = "";
    enterThePharmacyName.text = "";
    prefarableTime.text = "";
  }
}