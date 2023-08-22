import 'package:chit_chat/repositry/auth_repositry.dart';
import 'package:flutter/cupertino.dart';

class AuthViewModel extends ChangeNotifier{

  final _myRepo=AuthRepositry();

  Future<void> loginApi()async{
    _myRepo.loginApi(data)
  }
  
}