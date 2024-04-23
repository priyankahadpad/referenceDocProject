import 'dart:developer';

import 'package:demoproject/Api%20Implementation/setup/BaseApiServices.dart';
import 'package:demoproject/Api%20Implementation/setup/BaseManager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkApiServices extends BaseApiServices {
  Dio dio = Dio();
  String global_url = 'https://staging.eatwithdigest.com/api/';

  //String basicAuth = 'Basic ' + base64.encode(utf8.encode('admin:admin'));s
  @override
  Future<ResponseData> getApi(String url) async {
    if (kDebugMode) {
      print("api url is >>> $url");
    }
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token').toString();
    try {
      response = await dio.get(
        global_url + url,
        options: Options(
          headers: {
            "authorization": "Bearer $token",
            // 'access': "Bearer $token",
            // "device-id": deviceId
          },
        ),
      );
    } on Exception catch (e) {
      if (e is DioException) {
        log(e.response.toString());
        if (e.response!.statusCode == 403) {
          return ResponseData<dynamic>(
              e.response!.statusMessage!, ResponseStatus.PRIVATE,
              data: e.response!.data);
        } else if (e.response!.statusCode == 401) {
          return ResponseData<dynamic>(
            "token expired",
            ResponseStatus.FAILED,
            data: e.response!.data,
          );
        }
      }
      return ResponseData<dynamic>(
        'Oops something Went Wrong',
        ResponseStatus.FAILED,
      );
    }
    if (response.statusCode == 200) {
      return ResponseData<dynamic>(
        "success",
        data: response.data,
        ResponseStatus.SUCCESS,
      );
    } else if (response.statusCode == 401) {
      return ResponseData<dynamic>(
        "token expired",
        data: response.data,
        ResponseStatus.FAILED,
      );
    } else {
      try {
        return ResponseData<dynamic>(
            response.data['message'].toString(), ResponseStatus.FAILED);
      } catch (_) {
        return ResponseData<dynamic>(
            response.statusMessage!, ResponseStatus.FAILED);
      }
    }
  }

  @override
  Future<ResponseData> postApi(data, String url) async {
    if (kDebugMode) {
      print("data >>> $data");
      print("api url is >>> $url");
    }
    Response response;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    try {
      response = await dio.post(
        global_url + url,
        data: data,
        options: token != null
            ? Options(headers: {
                "authorization": "Bearer $token",
                // 'access-token': token,
                // "device-id": deviceId
              })
            : Options(
                headers: {
                  // "authorization": basicAuth,
                  // "device-id": deviceId
                },
              ),
      );
    } on Exception catch (e) {
      if (e is DioException) {
        log(e.response.toString());
        if (e.response!.statusCode == 403) {
          return ResponseData<dynamic>(
              e.response!.statusMessage!, ResponseStatus.FAILED,
              data: e.response!.data);
        } else if (e.response!.statusCode == 401) {
          return ResponseData<dynamic>(
            "token expired",
            ResponseStatus.FAILED,
            data: e.response!.data,
          );
        }
      }
      return ResponseData<dynamic>(
        'Oops something Went Wrong',
        ResponseStatus.FAILED,
      );
    }

    if (response.statusCode == 200) {
      return ResponseData<dynamic>("success", ResponseStatus.SUCCESS,
          data: response.data);
    } else if (response.statusCode == 201) {
      return ResponseData<dynamic>("success", ResponseStatus.SUCCESS,
          data: response.data);
    } else if (response.statusCode == 203) {
      print(response.data);
      return ResponseData<dynamic>("success", ResponseStatus.PRIVATE,
          data: response.data);
    } else {
      try {
        return ResponseData<dynamic>(
            response.data['message'].toString(), ResponseStatus.FAILED);
      } catch (_) {
        return ResponseData<dynamic>(
            response.statusMessage!, ResponseStatus.FAILED);
      }
    }
  }

  Future<ResponseData> putApi(data, String url) async {
    if (kDebugMode) {
      print("data >>> $data");
      print("api url is >>> $url");
    }
    Response response;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    try {
      response = await dio.put(
        global_url + url,
        data: data,
        options: token != null
            ? Options(headers: {
                "authorization": "Bearer $token",
                // 'access-token': token,
                // "device-id": deviceId
              })
            : Options(
                headers: {
                  // "authorization": basicAuth,
                  // "device-id": deviceId
                },
              ),
      );
    } on Exception catch (e) {
      if (e is DioException) {
        log(e.response.toString());
        if (e.response!.statusCode == 403) {
          return ResponseData<dynamic>(
              e.response!.statusMessage!, ResponseStatus.FAILED,
              data: e.response!.data);
        }
      }
      return ResponseData<dynamic>(
        'Oops something Went Wrong',
        ResponseStatus.FAILED,
      );
    }

    if (response.statusCode == 200) {
      return ResponseData<dynamic>("success", ResponseStatus.SUCCESS,
          data: response.data);
    } else if (response.statusCode == 201) {
      return ResponseData<dynamic>("success", ResponseStatus.SUCCESS,
          data: response.data);
    } else if (response.statusCode == 203) {
      print(response.data);
      return ResponseData<dynamic>("success", ResponseStatus.PRIVATE,
          data: response.data);
    } else {
      try {
        return ResponseData<dynamic>(
            response.data['message'].toString(), ResponseStatus.FAILED);
      } catch (_) {
        return ResponseData<dynamic>(
            response.statusMessage!, ResponseStatus.FAILED);
      }
    }
  }

  Future<ResponseData> deleteApi(String url) async {
    if (kDebugMode) {
      // print("data >>> $data");
      print("api url is >>> $url");
    }
    Response response;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    try {
      response = await dio.delete(
        global_url + url,
        data: '',
        options: token != null
            ? Options(headers: {
                "authorization": "Bearer $token",
                // 'access-token': token,
                // "device-id": deviceId
              })
            : Options(
                headers: {
                  // "authorization": basicAuth,
                  // "device-id": deviceId
                },
              ),
      );
    } on Exception catch (e) {
      if (e is DioException) {
        log(e.response.toString());
        if (e.response!.statusCode == 403) {
          return ResponseData<dynamic>(
              e.response!.statusMessage!, ResponseStatus.FAILED,
              data: e.response!.data);
        }
      }
      return ResponseData<dynamic>(
        'Oops something Went Wrong',
        ResponseStatus.FAILED,
      );
    }

    if (response.statusCode == 200) {
      return ResponseData<dynamic>("success", ResponseStatus.SUCCESS,
          data: response.data);
    } else if (response.statusCode == 201) {
      return ResponseData<dynamic>("success", ResponseStatus.SUCCESS,
          data: response.data);
    } else if (response.statusCode == 204) {
      return ResponseData<dynamic>("success", ResponseStatus.SUCCESS);
    } else if (response.statusCode == 203) {
      print(response.data);
      return ResponseData<dynamic>("success", ResponseStatus.PRIVATE,
          data: response.data);
    } else {
      try {
        return ResponseData<dynamic>(
            response.data['message'].toString(), ResponseStatus.FAILED);
      } catch (_) {
        return ResponseData<dynamic>(
            response.statusMessage!, ResponseStatus.FAILED);
      }
    }
  }
}
