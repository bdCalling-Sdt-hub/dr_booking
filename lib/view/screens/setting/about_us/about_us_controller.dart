import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../core/global/api_response_model.dart';
import 'about_us_model.dart';
import 'about_us_repo.dart';

class AboutUsController extends GetxController {

  AboutUsRepo aboutRepo;
  AboutUsController({required this.aboutRepo});

  bool isLoading = false;
  AboutUsModel aboutUsModel = AboutUsModel();
  String about= "";

  Future<void> aboutUs() async {
    isLoading = true;
    update();
    ApiResponseModel responseModel = await aboutRepo.responseAboutUsData();
    if (responseModel.statusCode == 200) {
      aboutUsModel = AboutUsModel.fromJson(jsonDecode(responseModel.responseJson));
      about = aboutUsModel.data!.description?? "";
      isLoading = false;
      update();
    } else {
      isLoading = false;
      update();
    }
  }
}
