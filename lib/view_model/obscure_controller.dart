import 'package:flutter/material.dart';

class ObscureController extends ChangeNotifier{

  bool _obscureText=true;
  bool get obscureText=> _obscureText;

  void toggleObscure(){
    _obscureText=!obscureText;
    notifyListeners();
  }
  
}