import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class DioNetworkHelper{
  Future getData(String url) async {
    var _dio = Dio();
    print("calling getData url: " + url);
    late Response response;
    try {
      response = await _dio.get(url,
      ).timeout(const Duration(seconds: 30));
      print("api response $response");
      return response;
    } on TimeoutException catch (e) {
      print('TimeOut exception: $e');
      return null;
    } on SocketException catch (e) {
      print('Socket Error: $e');
      return null;
    } on DioError catch (e) {
      print('General Error: $e');
      print("${e.response?.statusCode}");
      if (e.response?.statusCode == 400) {
        return e.response;
      }
      return null;
    }
  }

  Future getDataAuthHeader({
    required String url,
    required String? headerToken,
  }) async {
    var _dio = Dio();
    // print("calling getDataAuthHeader url: " + url);
    late Response response;
    // print(headerToken);
    try {
      _dio.options.headers["Authorization"] =
      (headerToken != '' || headerToken != null)
          ? "Bearer $headerToken"
          : null;
      response = await _dio.get(url).timeout(const Duration(seconds: 60));
      return response;
    } on TimeoutException catch (e) {
      // print('TimeOut exception: $e');
      return null;
    } on SocketException catch (e) {
      // print('Socket Error: $e');
      return null;
    } on DioError catch (e) {
      // print('General Error: $e');
      // print("${e.response?.statusCode}");
      return null;
    }
  }

  Future postDataAuthHeader(
      {required String url,
        required Map postBody,
        required String headerToken}) async {
    var _dio = Dio();
    // print("calling postDataAuthNoCntxtHeader url: " + url);
    // print("$postBody");
    // print(headerToken);
    try {
      _dio.options.headers["Authorization"] = "Bearer $headerToken";
      Response response = await _dio
          .post(url, data: json.encode(postBody))
          .timeout(const Duration(seconds: 30));
      return response;
    } on TimeoutException catch (e) {
      // print('TimeOut exception: $e');
      return null;
    } on SocketException catch (e) {
      // print('Socket Error: $e');
      return null;
    } on DioError catch (e) {
      // print('General Error: $e');
      // print("${e.response?.statusCode}");
      if (e.response?.statusCode == 400) {
        //for duplicate note added
        return e.response;
      }

      return null;
    }
  }

}