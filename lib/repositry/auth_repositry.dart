import 'package:chit_chat/data/Network/baseapiservices.dart';
import 'package:chit_chat/data/Network/networkapiservices.dart';
import 'package:chit_chat/res/app_url.dart';

class AuthRepositry {

  final BaseApiService _apiService=NetworkApiService();

  Future<dynamic> loginApi(dynamic data)async{
    try {
      dynamic response=_apiService.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
      
    } catch (e) {
      throw e;
      
    }
  }

    Future<dynamic> signUpApi(dynamic data)async{
    try {
      dynamic response=_apiService.getPostApiResponse(AppUrl.signupUrl, data);
      
    } catch (e) {
      throw e;
      
    }
  }
  
}