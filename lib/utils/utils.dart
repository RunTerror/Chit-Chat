import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class Utils {
  static showFlushbar(BuildContext context, String message) {
    final theme=Theme.of(context);
    Flushbar(
      messageText: Text(message, style: GoogleFonts.openSans(fontWeight: FontWeight.w700),),
      leftBarIndicatorColor: const Color.fromARGB(255, 181, 103, 98),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.white,
      messageColor: theme.primaryColor,
      icon:const Icon(Icons.error,),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      duration: const Duration(seconds: 3),
    ).show(context);
  }

  static showtoast(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static focusnode(BuildContext context, FocusNode currentnode, FocusNode nextnode){
    currentnode.unfocus();
    FocusScope.of(context).requestFocus(nextnode);
  }


}
