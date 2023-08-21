import 'package:flutter/material.dart';

class LandingProvider extends ChangeNotifier{

  bool _check=false;
  bool get check=> _check;

  toogleCheck(){
    _check=!_check;
    notifyListeners();
  }
}