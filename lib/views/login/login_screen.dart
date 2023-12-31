import 'package:chit_chat/res/app_url.dart';
import 'package:chit_chat/res/components/box.dart';
import 'package:chit_chat/res/components/constant_string.dart';
import 'package:chit_chat/res/components/customtextfield.dart';
import 'package:chit_chat/utils/route_names.dart';
import 'package:chit_chat/utils/utils.dart';
import 'package:chit_chat/view_model/auth_view_model.dart';
import 'package:chit_chat/view_model/obscure_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneConroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var obscuretext = true;
  FocusNode numberNode=FocusNode();
    FocusNode passwordNode=FocusNode();
  @override
  Widget build(BuildContext context) {
    final auth= Provider.of<AuthViewModel>(context);
    
    var theme = Theme.of(context);
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(children: [
        CustomContainer(
            child: null,
            borderRadius: 0,
            color: theme.primaryColor,
            h: h,
            w: w),
            Positioned(top: h-h/1.6-200, child: Image.asset('assets/images/monkey_1998721.png',height: 200,width: w,)),
        Positioned(
            top: h - h / 1.4,
            child: Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 50,
              ),
              height: h / 1.4,
              width: w,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: ListView(
                children: [
                  CustomTextField(
                    nextnode: passwordNode,
                    focusNode: numberNode,
                     textInputType: TextInputType.number,
                      controller: _phoneConroller,
                      hintText: ConstantString.phone,
                      iconData: CupertinoIcons.phone),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<ObscureController>(
                    builder: (context, value, child) {
                      return CustomTextField(
                        focusNode: passwordNode,
                        nextnode: null,
                        obscureText: value.obscureText,
                        controller: _passwordController,
                        hintText: ConstantString.password,
                        iconData: value.obscureText? Icons.lock: Icons.lock_open,
                        suffixIcon:value.obscureText?CupertinoIcons.eye: CupertinoIcons.eye_slash,
                        function: () {
                          value.toggleObscure();
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      if(_phoneConroller.text.length<10){
                        Utils.showFlushbar(context, "Enter 10 digit phone number");
                      }
                      else if(_passwordController.text.length<6) {
                        Utils.showFlushbar(context, "Enter at least 6 digit password");
                      }
                      else{
                        var number='+91 ${_phoneConroller.text.trim().toString()}';
                         Map<String, dynamic> data={
                        "number": number,
                        "password": _passwordController.text.toString()
                      };
                      auth.loginApi(data, context);
                      }
                    },
                    child: CustomContainer(
                        borderRadius: 20,
                        color: theme.primaryColor,
                        h: h / 15,
                        w: w,
                        child:auth.loading==false? Text(
                          ConstantString.login,
                          style: GoogleFonts.openSans(color: Colors.white),
                        ):const Center(child: CircularProgressIndicator(color: Colors.white,),)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(ConstantString.bottomSignUpString, style: GoogleFonts.openSans(fontWeight: FontWeight.w600,),), InkWell(onTap: () {
                      Navigator.pushNamed(context, RouteNames.signupScreen);
                    },child: Text(ConstantString.signup, style: GoogleFonts.openSans(fontWeight: FontWeight.w700),),)],

                  )
                ],
              ),
            ))
      ]),
    );
  }
}
