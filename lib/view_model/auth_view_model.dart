import 'package:chit_chat/model/usermodel.dart';
import 'package:chit_chat/repositry/auth_repositry.dart';
import 'package:chit_chat/utils/route_names.dart';
import 'package:chit_chat/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  toogleloading() {
    _loading = !loading;
    notifyListeners();
  }

  final _myRepo = AuthRepositry();

  Future<void> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(
      'token',
      user.token.toString(),
    );
    sp.setString('name', user.name.toString());
    sp.setString('userid', user.userid.toString());
    sp.setString('number', user.number.toString());
  }

  Future<void> loginApi(Map<String, dynamic> data, BuildContext context) async {
    toogleloading();
    _myRepo.loginApi(data).then((value) {
      if (value is String) {
        Utils.showtoast(value);
        toogleloading();
        return;
      }
      var user = UserModel.fromJson(value as Map<String, dynamic>);
      saveUser(user);
      Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.chitScreen, (route) => false);
      toogleloading();
    }).onError((error, stackTrace) {
      Utils.showFlushbar(context, error.toString());
      toogleloading();
    });
  }

  Future<void> signupApi(
      Map<String, dynamic> data, BuildContext context) async {
    toogleloading();
    _myRepo.signUpApi(data, context).then((value) {
      Utils.showtoast(value);
      Navigator.pop(context);
      toogleloading();
    }).onError((error, stackTrace) {
      Utils.showFlushbar(context, error.toString());
      toogleloading();
    });
  }
}
