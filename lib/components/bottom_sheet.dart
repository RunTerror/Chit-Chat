import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bottomsheet extends StatelessWidget {
  const Bottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      height: 200,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: theme.primaryColor,
            radius: 30,
            child:const Icon(CupertinoIcons.mic_solid, weight: 30,color: Colors.white,),
          ),
           CircleAvatar(
            backgroundColor: theme.primaryColor,
            radius: 30,
            child:const Icon(CupertinoIcons.photo, weight: 30,color: Colors.white,),
          ),
           CircleAvatar(
            backgroundColor: theme.primaryColor,
            radius: 30,
            child:const Icon(CupertinoIcons.camera, weight: 30,color: Colors.white,),
          ),
        ],
      ),
    );
  }
}
