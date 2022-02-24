import 'package:astrotak_assignment/models/all_relatives_model.dart';
import 'package:dio/dio.dart';

import '../utilities/api_endpoints.dart';
import 'dio_network_helper.dart';

class AllRelativesService {
  final DioNetworkHelper _dioNetworkHelper = DioNetworkHelper();

  Future<AllRelativesModel?> fetchAllRelatives() async {
    Response response = await _dioNetworkHelper.getDataAuthHeader(url: ApiEndpoints.allRelativesGetApi, headerToken: ApiEndpoints.bearerToken);
    if(response.data != null){
      print("response.data ${response.data}");
      return AllRelativesModel.fromJson(response.data);
    }
    return null;
  }
}