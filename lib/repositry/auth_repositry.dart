import 'package:chit_chat/data/Network/networkapiservices.dart';
import 'package:chit_chat/res/app_url.dart';
import 'package:flutter/cupertino.dart';

class AuthRepositry {
  final _apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      // rethrow;
    }
  }

  Future<dynamic> signUpApi(dynamic data, BuildContext context) async {
    try {
      dynamic response =
          await _apiService.getPostApiResponse(AppUrl.signupUrl, data);
      return response;
    } catch (e) {
        // Utils.showFlushbar(context, e.toString());
    }
  }
}
