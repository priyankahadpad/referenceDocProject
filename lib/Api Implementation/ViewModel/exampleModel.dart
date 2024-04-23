import 'dart:async';

import 'package:demoproject/Api%20Implementation/setup/BaseManager.dart';
import 'package:demoproject/Api%20Implementation/setup/network_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

// GetExampleModel? getExampleObj;

class ExampleAPI {
  ExampleAPI();

  Future<ResponseData<dynamic>> postexampleApi(var data) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await NetworkApiServices().postApi(
      data,
      "api",
    );
    if (response.data['success'] == true) {
      return ResponseData<dynamic>(
          response.data['message'], ResponseStatus.SUCCESS);
    } else {
      return ResponseData<dynamic>(
          response.data['message'], ResponseStatus.FAILED);
    }
  }

  Future<ResponseData<dynamic>> getexampleApi(int id) async {
    final response = await NetworkApiServices().getApi(
      "api" + id.toString(),
    );

    if (response.status == ResponseStatus.SUCCESS) {
      // getExampleObj = GetExampleModel.fromJson(response.data);
      if (response.data['success'] == true) {
        return ResponseData<dynamic>(
            response.data['message'], ResponseStatus.SUCCESS,
            data: response.data);
      } else {
        return ResponseData<dynamic>(
            response.data['message'], ResponseStatus.FAILED);
      }
    }

    return response;
  }

  Future<ResponseData<dynamic>> putexampleApi(int id, var data) async {
    final response = await NetworkApiServices().putApi(
      data,
      "api" + id.toString() + '/',
    );

    if (response.status == ResponseStatus.SUCCESS) {
      // getExampleObj = GetExampleModel.fromJson(response.data);
      if (response.data['success'] == true) {
        return ResponseData<dynamic>(
            response.data['message'], ResponseStatus.SUCCESS,
            data: response.data);
      } else {
        return ResponseData<dynamic>(
            response.data['message'], ResponseStatus.FAILED);
      }
    }

    return response;
  }

  Future<ResponseData<dynamic>> deleteexampleApi(int id) async {
    final response = await NetworkApiServices().deleteApi(
      "api" + id.toString() + '/',
    );

    if (response.status == ResponseStatus.SUCCESS) {
      // getExampleObj = GetExampleModel.fromJson(response.data);
      if (response.message == 'success') {
        return ResponseData<dynamic>(response.message, ResponseStatus.SUCCESS);
      } else {
        return ResponseData<dynamic>(
            response.data['message'], ResponseStatus.FAILED);
      }
    }

    return response;
  }
}


