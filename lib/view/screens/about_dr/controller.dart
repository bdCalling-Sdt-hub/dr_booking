import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../core/global/api_response_model.dart';
import 'model.dart';
import 'repo.dart';

class AboutController extends GetxController {
  AboutRepo aboutRepo;
  AboutController({required this.aboutRepo});

  bool isLoading = false;
  AboutModel aboutModel = AboutModel();
  String aboutDr= "";

  Future<void> aboutdrData() async {
    isLoading = true;
    update();
    ApiResponseModel responseModel = await aboutRepo.responseAboutData();
    if (responseModel.statusCode == 200) {
      aboutModel = AboutModel.fromJson(jsonDecode(responseModel.responseJson));
      aboutDr = aboutModel.data?.description ?? "";
      isLoading = false;
      update();
    } else {
      isLoading = false;
      update();
    }
  }
}
