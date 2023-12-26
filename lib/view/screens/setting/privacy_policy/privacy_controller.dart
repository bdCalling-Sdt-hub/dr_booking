import 'dart:convert';

import 'package:dr_booking/view/screens/setting/privacy_policy/model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../core/global/api_response_model.dart';

import 'privacy_repo.dart';

class PrivacyController extends GetxController {

  PrivacyRepo aboutRepo;
  PrivacyController({required this.aboutRepo});

  bool isLoading = false;
  PrivacyPolicyModel privacyModel = PrivacyPolicyModel();
  String privacyData= "";

  Future<void> getPrivacyData() async {
    isLoading = true;
    update();
    ApiResponseModel responseModel = await aboutRepo.responsePrivacyData();
    if (responseModel.statusCode == 200) {
      privacyModel = PrivacyPolicyModel.fromJson(jsonDecode(responseModel.responseJson));
      privacyData = privacyModel.data?.description ?? "";
      isLoading = false;
      update();
    } else {
      isLoading = false;
      update();
    }
  }
}
