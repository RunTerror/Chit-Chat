
import 'dart:convert';

import 'package:chit_chat/res/app_url.dart';
import 'package:chit_chat/res/components/box.dart';
import 'package:chit_chat/res/components/constant_string.dart';
import 'package:chit_chat/res/components/customtextfield.dart';
import 'package:chit_chat/utils/utils.dart';
import 'package:chit_chat/view_model/auth_view_model.dart';
import 'package:chit_chat/view_model/obscure_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  FocusNode numberNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode nameNode = FocusNode();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneConroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var obscuretext = true;
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    final authviewmodel = Provider.of<AuthViewModel>(context);


    return Scaffold(
      body: Stack(children: [
        CustomContainer(
            child: null,
            borderRadius: 0,
            color: theme.primaryColor,
            h: h,
            w: w),
        Positioned(
            top:h-h/1.6-200,
            child: Image.asset(
              'assets/images/monkey_1998721.png',
              height: 200,
              width: w,
            )),
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
                      nextnode: numberNode,
                      focusNode: nameNode,
                      controller: _nameController,
                      hintText: ConstantString.name,
                      iconData: CupertinoIcons.person),
                  const SizedBox(
                    height: 20,
                  ),
                   CustomTextField(
                      nextnode: passwordNode,
                      focusNode: numberNode,
                      controller: _phoneConroller,
                      hintText: ConstantString.phone,
                      iconData: CupertinoIcons.phone),
                  const SizedBox(
                    height: 20,
                  ),
                  
                  // Container(width: w, height: h/1.4,decoration: BoxDecoration(color: Colors.transparent,borderRadius: BorderRadius.all(Radius.circular(10))),),
                  // Container(
                  //     decoration: BoxDecoration(
                  //         border: Border.all(
                  //           width: 1,
                  //         ),
                  //         borderRadius:
                  //             const BorderRadius.all(Radius.circular(10))),
                  //     child: InternationalPhoneNumberInput(

                  //       formatInput: true,
                  //       inputDecoration:const InputDecoration(border: InputBorder.none),
                  //       onInputChanged: (value) {
                        
                  //     },)),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Consumer<ObscureController>(
                    builder: (context, value, child) {
                      return CustomTextField(
                        nextnode: null,
                        focusNode: passwordNode,
                        obscureText: value.obscureText,
                        controller: _passwordController,
                        hintText: ConstantString.password,
                        iconData:
                            value.obscureText ? Icons.lock : Icons.lock_open,
                        suffixIcon: value.obscureText
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
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
                    onTap: () async {
                      if (_nameController.text.isEmpty) {
                        Utils.showFlushbar(context, "Enter name!");
                      } else if (_passwordController.text.length < 6) {
                        Utils.showFlushbar(
                            context, "Enter at least 6 digit password");
                      } else {
                        var number='+91 ${_phoneConroller.text.trim().toString()}';
                        Map<String, dynamic> data = {
                          "name": _nameController.text.trim(),
                          "number": number,
                          "password": _passwordController.text.trim()
                        };
                       authviewmodel.signupApi(data, context);
                      }
                    },
                    child: CustomContainer(
                        borderRadius: 20,
                        color: theme.primaryColor,
                        h: h / 15,
                        w: w,
                        child:authviewmodel.loading==false? Text(
                          ConstantString.signup,
                          style: GoogleFonts.openSans(color: Colors.white),
                        ):const CircularProgressIndicator(color: Colors.white,)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ConstantString.bottomLogInString,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          ConstantString.login,
                          style:
                              GoogleFonts.openSans(fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ))
      ]),
    );
  }
}
