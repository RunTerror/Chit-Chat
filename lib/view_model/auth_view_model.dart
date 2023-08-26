import 'package:chit_chat/repositry/auth_repositry.dart';
import 'package:flutter/cupertino.dart';

class AuthViewModel extends ChangeNotifier{

  final _myRepo=AuthRepositry();

  Future<void> loginApi(Map<String, dynamic> data)async{
    _myRepo.loginApi(data).then((value){
      print(value.toString());
    }).onError((error, stackTrace){
      print(error.toString());
    });
  }

  Future<void> signupApi(Map<String, dynamic> data)async{
    _myRepo.signUpApi(data).then((value){
      print(value.toString());
    }).onError((error, stackTrace){
      print(error.toString());
    });
  }
  
}