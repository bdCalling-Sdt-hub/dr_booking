import 'dart:convert';
import 'package:dr_booking/core/global/api_url_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../utils/app_colors.dart';
import '../../../widgets/bottom_nav/custom_bottom_nav_bar.dart';

class IntakeFormController extends GetxController {

  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController reasonVisitController = TextEditingController();
  TextEditingController presentMedicationController = TextEditingController();
  TextEditingController prefareableTimeController = TextEditingController();
  TextEditingController allergiesdesriptionController = TextEditingController();


  List <String> contactby = ["Your cell number", "Email"];
  int selectedcategory = 0;
  List <String> mailAddWithUser = ["Yes", "Not at time"];
  int selectedIndex = 0;

  bool isLoading = false;

  sendIntakeFormData() async {
    isLoading = true;
    update();
    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.intakeEndPoint}";
    var request = http.MultipartRequest('POST', Uri.parse(uri),);
    Map<String, String> body = {
      'name': nameController.text,
      'dateOfBirth': dobController.text,
      'address': addressController.text,
      'phoneNumber': phoneNumberController.text,
      'email': emailController.text,
      'contactBy': contactby[selectedcategory],
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

    if (response.statusCode == 200) {
      removeData();
      // String message = parsedResponse['message'];
      /*  isLoading = true;
    update();*/
      debugPrint("============> Response : $responseBody");
      Get.snackbar("Success", message.toString(),
          backgroundColor: AppColors.foundationColor,
          duration: const Duration(seconds: 10),
          colorText: Colors.white);

      Get.to(const CustomNavBar());


    }
    else{
      Get.snackbar("Alert",message.toString(),backgroundColor: Colors.redAccent,duration: const Duration(seconds: 10),colorText: AppColors.whiteColor);
      removeData();
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

  removeData(){
    nameController.text =  "";
    dobController.text="";
    addressController.text = "";
    phoneNumberController.text = "";
    occupationController.text = "";
    reasonVisitController.text = "";
    allergiesdesriptionController.text = "";
    presentMedicationController.text= "";
    prefareableTimeController.text = "";


  }
}