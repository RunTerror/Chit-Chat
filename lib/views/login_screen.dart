import 'package:chit_chat/components/box.dart';
import 'package:chit_chat/components/constant_string.dart';
import 'package:chit_chat/components/customtextfield.dart';
import 'package:chit_chat/utils/route_names.dart';
import 'package:chit_chat/view_model/obscure_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneConroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var obscuretext = true;

  @override
  Widget build(BuildContext context) {
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
                        obscureText: value.obscureText,
                        controller: _passwordController,
                        hintText: ConstantString.password,
                        iconData: value.obscureText? Icons.lock: Icons.lock_open,
                        suffixIcon: CupertinoIcons.eye,
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
                      Navigator.pushReplacementNamed(context, RouteNames.chitScreen);
                    },
                    child: CustomContainer(
                        borderRadius: 20,
                        color: theme.primaryColor,
                        h: h / 15,
                        w: w,
                        child: Text(
                          ConstantString.signup,
                          style: GoogleFonts.openSans(color: Colors.white),
                        )),
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
