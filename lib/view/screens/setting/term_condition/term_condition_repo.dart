import 'package:dr_booking/core/global/api_response_method.dart';
import 'package:dr_booking/core/global/api_url_container.dart';
import 'package:dr_booking/sevice/api_service.dart';

import '../../../../core/global/api_response_model.dart';

class TermConditionRepo{
  TermConditionRepo({required this.apiService});
  ApiService apiService;


  responseTermConditionData()async{
    String uri =  "${ApiUrlContainer.baseUrl}${ApiUrlContainer.termconditionEndpoint}";
    String method =  ApiResponseMethod.getMethod;
    ApiResponseModel responseModel = await apiService.request(uri, method, null, passHeader: false);
    return responseModel;
  }
}
