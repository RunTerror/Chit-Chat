import 'package:chit_chat/components/box.dart';
import 'package:chit_chat/components/constant_string.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreen();
}

class _VerificationScreen extends State<VerificationScreen> {
  var obscuretext = true;
  final TextEditingController _verificationController = TextEditingController();

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
              child: Column(children: [
                PinCodeTextField(
                  autoUnfocus: true,
                    pinTheme: PinTheme(
                      activeFillColor: theme.primaryColor,
                      inactiveColor: Colors.black,
                      selectedColor: Colors.black,
                      activeColor: theme.primaryColor,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10), // Use a box shape
                      borderWidth: 1,
                      fieldHeight: 60,
                      fieldWidth: 50,
                    ),
                    autoFocus: true,
                    controller: _verificationController,
                    keyboardType: TextInputType.number,
                    appContext: context,
                    length: 6),
                const SizedBox(height: 10,),
                CustomContainer(
                    borderRadius: 20,
                    color: theme.primaryColor,
                    h: h / 15,
                    w: w,
                    child: Text(
                      "Verify",
                      style: GoogleFonts.openSans(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    )),
                    const SizedBox(height: 10,),
                    Text(ConstantString.bottomVerificationString, style: GoogleFonts.openSans(fontWeight: FontWeight.w600),),
                    const SizedBox(height: 5,),
                    InkWell(onTap:(){},child:Text(ConstantString.verificationButton, style: GoogleFonts.openSans(fontWeight: FontWeight.w700,color: theme.primaryColor),), )
              ]),
            ))
      ]),
    );
  }
}
