//api call using streambuilder

 import 'dart:async';

import 'package:demoproject/Api%20Implementation/setup/BaseManager.dart';
import 'package:demoproject/Api%20Implementation/setup/network_api.dart';
import 'package:shared_preferences/shared_preferences.dart';


// GetExampleModel? getExampleObj;

class ExampleAPI {
  ExampleAPI(); 


// Future<ResponseData<dynamic>> blogSearchAndFilter(updata,
//       {required StreamController<GetExampleModel> streamController}) async {
//     final response = await NetworkApiServices()
//         .postApi('https://thegsf.co/api/search',  updata);

//     if (response.status == ResponseStatus.SUCCESS) {
//       if (response.data["Result"] == "No Data found") {
//         if (!streamController.isClosed) {
//           streamController.sink
//               .add(GetExampleModel(message: "", success: false, result: []));
//           getExampleObj = GetExampleModel(message: "", success: false, result: []);
//         }
//         return response;
//       }
//       getExampleObj = GetExampleModel.fromJson(response.data);
//       if (!streamController.isClosed) streamController.sink.add(getExampleObj!);
//     }
//     return response;
//   }

//   Future<ResponseData<dynamic>> getHomeAPI(String date,
//       {required StreamController<GetExampleModel> streamController}) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     final response = await NetworkApiServices()
//         .getApi("activity/daily-records/?date=" + date);
//     // if (response.message == 'token expired') {
//     //   prefs.remove('token');
//     //   resetToken(prefs.getString('refreshToken')!);
//     //   return ResponseData<dynamic>(
//     //       'Something went wrong, please try again!', ResponseStatus.FAILED);
//     // }
//     if (response.status == ResponseStatus.SUCCESS) {
//       //Map<String, dynamic> responseData = jsonDecode(response.data);

//       if (response.data['success'] == true) {
//         getExampleObj = GetExampleModel.fromJson(response.data);
//         if (!streamController.isClosed) streamController.sink.add(getExampleObj!);
//         return ResponseData<dynamic>(
//             response.data['message'], ResponseStatus.SUCCESS,
//             data: response.data);
//       } else {
//         return ResponseData<dynamic>(
//             response.data['message'], ResponseStatus.FAILED);
//       }
//     }

//     return response;
//   }
}