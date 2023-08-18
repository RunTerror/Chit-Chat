import 'package:chit_chat/components/box.dart';
import 'package:flutter/material.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    
    return Stack(children: [
      CustomContainer(borderRadius: 0, color: theme.primaryColor, h: h, w: w),
      Positioned(top: h-h/1.15,child: Container(height: h/1.15,width: w, decoration:const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),color: Colors.white),))
    ],);
  }
}