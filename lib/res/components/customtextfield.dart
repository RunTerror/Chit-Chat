
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final FocusNode? nextnode;
  final TextInputType? textInputType;
  final VoidCallback? function;
  final bool? obscureText;
  final FocusNode focusNode;
  final TextEditingController controller;
  final String hintText;
  final IconData iconData;
  final IconData? suffixIcon;
  const CustomTextField({super.key,required this.controller, required this.hintText, required this.iconData, this.suffixIcon ,this.obscureText , this.function, this.textInputType, required this.focusNode,required this.nextnode});


  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {
        focusNode.unfocus();
        nextnode==null? null: FocusScope.of(context).requestFocus(nextnode);
      },
      focusNode: focusNode,
      keyboardType: textInputType,
      obscureText: obscureText==null? false: obscureText!,
      controller: controller,
      decoration: InputDecoration(hintStyle: GoogleFonts.openSans(fontWeight: FontWeight.w600),prefixIcon: Icon(iconData), suffixIcon: IconButton(onPressed: function, icon: Icon(suffixIcon)),hintText: hintText,border:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))), ),
    );
  }
}