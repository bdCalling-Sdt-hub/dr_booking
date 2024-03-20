import 'dart:convert';

import 'package:dr_booking/view/screens/setting/term_condition/model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../core/global/api_response_model.dart';
import 'term_condition_repo.dart';


class TermConditionController extends GetxController {

  TermConditionRepo termConditionRepo;
  TermConditionController({required this.termConditionRepo});

  bool isLoading = false;
  TermPolicyModel termPolicyModel = TermPolicyModel();
  String termCondition= "";

  Future<void> termConditionData() async {
    isLoading = true;
    update();
    ApiResponseModel responseModel = await termConditionRepo.responseTermConditionData();
    if (responseModel.statusCode == 200) {
      termPolicyModel = TermPolicyModel.fromJson(jsonDecode(responseModel.responseJson));
      termCondition = termPolicyModel.data?.description.toString() ?? "";
      isLoading = false;
      update();
    } else {
      isLoading = false;
      update();
    }
  }
}
