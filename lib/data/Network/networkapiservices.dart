import 'dart:convert';
import 'dart:io';
import 'package:chit_chat/data/Network/baseapiservices.dart';
import 'package:chit_chat/data/appexceptions.dart';
import 'package:chit_chat/utils/utils.dart';
import 'package:http/http.dart'as http;

class NetworkApiService extends BaseApiService{
  @override
 
  Future getGetApiResponse(String url)async {
     dynamic responsejson;
    try {
      final response=await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responsejson=returnResponse(response);
    } on SocketException {
      Utils.showtoast("no internet connection");
    }
    return responsejson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async{
  dynamic responsejson;
   try {
    final response=await http.post(Uri.parse(url), body: json.encode(data),headers: { 'Content-Type': 'application/json', } ).timeout(const Duration(seconds: 10));
    if(response.statusCode==200){
      return jsonDecode(response.body);
    }
    String msg=response.body.toString();
    return msg;
   } on SocketException{
     Utils.showtoast("no internet connection");
   }
   return responsejson;
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responsejson=jsonDecode(response.body);
        return responsejson;
      case 400:
        return BadrequestException(response.body.toString());
      case 404: 
        return UnauthorisedException(response.body.toString());
      default:
        throw FetchdataException("Error occured while communicating with server");
    }
  }
  
}