import 'dart:io';
import 'package:chit_chat/data/Network/baseapiservices.dart';
import 'package:chit_chat/data/appexceptions.dart';
import 'package:http/http.dart'as http;

class NetworkApiService extends BaseApiService{
  @override
  Future getGetApiResponse(String url)async {
    dynamic responsejson;
    try {
      final response=await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
    } on SocketException {
      throw FetchdataException("No internet connection!");
    }
  }

  @override
  Future getPostApiResponse(String url) {
    throw UnimplementedError();
  }
  
}