import 'package:chit_chat/utils/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatRoom extends StatelessWidget {
  const ChatRoom({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final theme=Theme.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h / 10),
        child: AppBar(
            titleSpacing: 0,
            actions: [
               IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.cameraScreen);
                  }, icon: const Icon(CupertinoIcons.camera)),
              IconButton(
                  onPressed: () {}, icon: const Icon(CupertinoIcons.phone)),

            ],
            title: Row(
              children: [
                CircleAvatar(
                  radius: h / 27,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Abhishek Bansal',
                      style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                    Text(
                      'online',
                      style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w200, fontSize: 16)),
                    )
                  ],
                )
              ],
            ),
            elevation: 5,
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(CupertinoIcons.back))),
      ),
      body: ListView(
          children: [
            SizedBox(
              height: h-h/10-MediaQuery.of(context).viewPadding.top,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/cover_chat.png',
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      bottom: 10,
                      left: (w-w/1.1)/2,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),  
                        width: w / 1.1,
                        height: h / 14,
                        decoration:const BoxDecoration(
                            color: Color.fromARGB(255, 200, 193, 193),
                            borderRadius: BorderRadius.all(Radius.circular(70))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              IconButton(onPressed: (){}, icon:const Icon(CupertinoIcons.smiley,)),
                              Container(width: w/2, alignment: Alignment.center,child:const TextField(decoration: InputDecoration(border: InputBorder.none, hintText: 'Type message...'),)),
                              IconButton(onPressed: (){}, icon:const Icon(CupertinoIcons.link,size: 26,)),
                              Spacer(),
                              CircleAvatar(radius: h/35,backgroundColor: theme.primaryColor,child: IconButton(onPressed: (){}, icon:const Icon(CupertinoIcons.mic, color: Colors.white,)))
                              ,Spacer()
                  
                            ],),
                      ))
                ],
              ),
            ),
          ],
        ),
    );
  }
}
