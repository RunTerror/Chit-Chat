import 'package:chit_chat/data/Network/baseapiservices.dart';
import 'package:chit_chat/data/Network/networkapiservices.dart';

class AuthRepositry {

  final BaseApiService _apiService=NetworkApiService();

  Future<dynamic> loginApi(dynamic data)async{
    try {
      dynamic response=_apiService.getPostApiResponse(AppUrl, data);
      return response;
      
    } catch (e) {
      throw e;
      
    }
  }

    Future<dynamic> signUpApi(dynamic data)async{
    try {
      dynamic response=_apiService.getPostApiResponse(AppUrl, data);
      
    } catch (e) {
      throw e;
      
    }
  }
  
}