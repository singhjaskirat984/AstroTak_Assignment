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

  Future<Response?> addRelative(Map postBody) async {
    Response response = await _dioNetworkHelper.postDataAuthHeader(url: ApiEndpoints.addRelativeApi, postBody: postBody, headerToken: ApiEndpoints.bearerToken);
    if(response.data != null){
      print("response.data adding relative ${response.data}");
      return response;
    }
    return null;
  }

  Future<Response?> deleteRelative(String uuid) async {
    Response response = await _dioNetworkHelper.postDataAuthHeader(url: "${ApiEndpoints.deleteRelativeApi}$uuid", postBody: {}, headerToken: ApiEndpoints.bearerToken);
    if(response.data != null){
      print("response.data deleting relative ${response.data}");
      return response;
    }
    return null;
  }

  Future<Response?> editRelative(String uuid, Map postBody) async {
    Response response = await _dioNetworkHelper.postDataAuthHeader(url: "${ApiEndpoints.editRelativeApi}$uuid", postBody: postBody, headerToken: ApiEndpoints.bearerToken);
    if(response.data != null){
      print("response.data editing relative ${response.data}");
      return response;
    }
    return null;
  }

}