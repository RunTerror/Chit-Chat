import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final dynamic child;
  final double h;
  final double w;
  final Color color;
  final double borderRadius;
  const CustomContainer({super.key,required this.borderRadius ,required this.color,required this.h ,required this.w, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: child,
                height: h,
                width: w,
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(borderRadius)),color: color));
  }
}