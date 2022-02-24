import 'package:astrotak_assignment/models/ask_question_model.dart';
import 'package:astrotak_assignment/services/dio_network_helper.dart';
import 'package:astrotak_assignment/utilities/api_endpoints.dart';
import 'package:dio/dio.dart';

class AskQuestionService {
  final DioNetworkHelper _dioNetworkHelper = DioNetworkHelper();

  Future<AskQuestionModel?> fetchQuestions() async {
    Response response = await _dioNetworkHelper.getData(ApiEndpoints.askQuestionApi);
    if(response.data != null){
      print("response.data ${response.data}");
      return AskQuestionModel.fromJson(response.data);
    }
    return null;
  }


}