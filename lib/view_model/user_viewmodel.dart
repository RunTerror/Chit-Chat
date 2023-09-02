import 'package:chit_chat/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel  extends ChangeNotifier{
   

  Future<bool> newUser(UserModel user)async{
    final SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    sp.setString('name', user.name.toString());
    sp.setString('userid', user.userid.toString());
    sp.setString('number', user.number.toString());
    final token=sp.getString('token');
    print('this is $token');
    notifyListeners();
    return true;
  }


  Future<UserModel>  getUser()async{
    final sp=await SharedPreferences.getInstance();
    final token=sp.getString('token');
    final name=sp.getString('name');
    final number=sp.getString('number');
    final userid=sp.getString('userid');
    return UserModel(token: token, name: name, number: number, userid: userid);
  }

  Future<bool> remove() async{
    final sp=await SharedPreferences.getInstance();
    return sp.clear();
  }
   
}