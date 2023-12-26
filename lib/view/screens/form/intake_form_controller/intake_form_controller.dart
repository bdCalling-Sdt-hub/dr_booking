import 'dart:convert';

import 'package:dr_booking/core/global/api_url_container.dart';
import 'package:dr_booking/utils/app_routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../utils/app_colors.dart';

class IntakeFormController extends GetxController{

  TextEditingController nameController =  TextEditingController();
  TextEditingController dobController =  TextEditingController();
  TextEditingController addressController =  TextEditingController();
  TextEditingController phoneNumberController =  TextEditingController();
  TextEditingController emailController =  TextEditingController();
  TextEditingController occupationController =  TextEditingController();
  TextEditingController reasonVisitController =  TextEditingController();
  TextEditingController presentMedicationController =  TextEditingController();
  TextEditingController prefareableTimeController =  TextEditingController();
  TextEditingController allergiesdesriptionController =  TextEditingController();


  List <String> contactby  =  ["Your cell number","Email"];
  int selectedcategory =  0;
  List <String> mailAddWithUser  =  ["Yes","Not a this time"];
  int selectedIndex = -1;

  bool isLoading = false;

sendIntakeFormData () async{
   String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.intakeEndPoint}";
   var request = http.MultipartRequest('POST', Uri.parse(uri),);
  Map<String ,String>  body= {
    'name': nameController.text,
    'dateOfBirth': dobController.text,
    'address': addressController.text,
    'phoneNumber': phoneNumberController.text,
    'email': emailController.text ,
    'contactBy':contactby[selectedcategory] ,
    'mailAddWithUser': mailAddWithUser[selectedIndex],
    'occupation': occupationController.text,
    'reasonOfVisit': reasonVisitController.text,
     'allergies': allergiesdesriptionController.text,
     'presentMedication': presentMedicationController.text,
    'prefarableTime': prefareableTimeController.text

  };


   print("===================body>$body");
   // body.forEach((key, value) {
   //   request.fields[key] = value;
   // });
   // request.headers['Content-Type'] = 'multipart/form-data';
  print("===================body>$body");
  print("===================uri  == $uri");

  request.fields.addAll(body);

   var response = await request.send();

   String responseBody = await response.stream.bytesToString();

   // Parse the JSON string
   Map<String, dynamic> parsedResponse = jsonDecode(responseBody);

   // Access the "message" field
   String message = parsedResponse['message'];

  if(response.statusCode == 200){
    isLoading = true;
    update();
    debugPrint("============> Response : $responseBody");
    Get.snackbar("success",message.toString(),backgroundColor: AppColors.foundationColor,duration: Duration(seconds: 30),colorText: Colors.white);
    Get.toNamed(AppRoute.homeScreen);
  }

  else {
    Get.snackbar("error",message.toString());
  }
   isLoading = false;
   update();
}

  Future<void> dateofbirthPicker(BuildContext context) async{
    final DateTime? picked = await showDatePicker(
      builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(
            colorScheme:  const ColorScheme.light(
              primary: AppColors.foundationColor, // <-- SEE HERE
              onPrimary: AppColors.whiteColor, // <-- SEE HERE
              onSurface: AppColors.foundationColor, // <-- SEE HERE
            ),
          ),
          child: child!
      ),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked !=dobController.text) {
      dobController.text = "${picked.year}/${picked.month}/${picked.day}";
      update();
    }
  }

}