import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double h;
  final double w;
  final Color color;
  final double borderRadius;
  const CustomContainer({super.key,required this.borderRadius ,required this.color,required this.h ,required this.w});

  @override
  Widget build(BuildContext context) {
    return Container(
                height: h,
                width: w,
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(borderRadius)),color: color));
  }
}