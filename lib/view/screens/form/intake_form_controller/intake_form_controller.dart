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
  int selectedcategory =  -1;
  List <String> mailAddWithUser  =  ["Yes","Not a this time"];
  int selectedIndex = -1;

sendIntakeFormData() async{

   String uri = " ${ApiUrlContainer.baseUrl}${ApiUrlContainer.intakeEndPoint}";
  // String uri = "192.168.10.13:8000/api/intake-form";

   var request = http.MultipartRequest('POST', Uri.parse("http://192.168.10.13:8000/api/intake-form"),);

  Map<String ,String>  body= {
 'name': nameController.text,
    'dateOfBirth': dobController.text,
    'address': addressController.text,
    'phoneNumber': phoneNumberController.text,
    'email': emailController.text,
    'contactBy':contactby[selectedcategory] ,
    'mailAddWithUser': mailAddWithUser[selectedIndex],
    'occupation': occupationController.text ?? "",
    'reasonOfVisit': reasonVisitController.text ?? "",
    'allergies': allergiesdesriptionController.text ?? "",
    'presentMedication': presentMedicationController.text ??"",
    'prefarableTime': prefareableTimeController.text ?? ""


   /* 'name': 'tushar',
    'dateOfBirth': '2023-12-13',
    'address': 'jatrabari,matuail,demra-dhaka',
    'phoneNumber': '01409130405',
    'email': 'tusharer11e@gmail.com',
    'contactBy': 'email',
    'mailAddWithUser': 'yes',
    'occupation': 'Businessman',
    'reasonOfVisit': 'pain',
    'allergies': 'no i have no allergies',
    'presentMedication': 'lorem ipsum',
    'prefarableTime': '3:20 PM'*/

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
    debugPrint("============> Response : $responseBody");
    Get.snackbar("success",message.toString());
    Get.toNamed(AppRoute.homeScreen);
  }
 /* else {
    Get.snackbar("error",message.toString());
  }*/

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
      dobController.text = "${picked.year}-${picked.month}-${picked.day}";
      update();
    }
  }

}