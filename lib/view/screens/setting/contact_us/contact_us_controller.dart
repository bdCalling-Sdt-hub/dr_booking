import 'dart:convert';
import 'package:dr_booking/core/global/api_url_container.dart';
import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/utils/app_routes.dart';
import 'package:dr_booking/view/widgets/bottom_nav/custom_bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ContactUsController extends GetxController{

  TextEditingController nameController =  TextEditingController();
  TextEditingController emailController =  TextEditingController();
  TextEditingController subjectController =  TextEditingController();
  TextEditingController  messageController =  TextEditingController();

  bool isLoading = false;

  sendContactInfo() async{
    isLoading = true;
    update();
    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.contactUsEndPondEnd}";
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    Map<String,String> body ={

      'name': nameController.text,
      'email': emailController.text,
      'subject': subjectController.text,
      'message': messageController.text

    };

    request.fields.addAll(body);

    var response = await request.send();
    String responseBody = await response.stream.bytesToString();
    // Parse the JSON string
    Map<String, dynamic> parsedResponse = jsonDecode(responseBody);

    // Access the "message" field
    String message = parsedResponse['data'];

    if(response.statusCode== 200){
      debugPrint("============> Response : $responseBody");
      Get.snackbar("Success",message.toString(),backgroundColor: AppColors.foundationColor,duration: const Duration(seconds: 30),colorText: Colors.white);
      Get.to(const CustomNavBar());
    }

    else{
      Get.snackbar("Error",message.toString(),backgroundColor: AppColors.foundationColor,duration: const Duration(seconds: 30),colorText: Colors.white);
      Get.toNamed(AppRoute.homeScreen);
    }
    isLoading = false;
    update();

  }

}

