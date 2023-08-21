import 'package:chit_chat/components/box.dart';
import 'package:chit_chat/utils/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor: theme.primaryColor,onPressed: (){
        Navigator.pushNamed(context, RouteNames.searchScreen);
      }, child:const Icon(CupertinoIcons.chat_bubble, color: Colors.white,)),
      body: Stack(
        children: [
          CustomContainer(child: null,borderRadius: 0, color: Colors.white, h: h, w: w),
          ListView.builder(itemBuilder: (context, index) {
            return Container(
                margin:const EdgeInsets.symmetric(vertical: 10),
                child: Material(
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.chatRoom);
                    },
                    trailing:const Text("10:00"),
                    leading: CircleAvatar(radius: h/25,),
                    title:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      Text('Abhishek Bansal',maxLines: 1,overflow: TextOverflow.ellipsis , style: GoogleFonts.poppins(textStyle:const TextStyle(fontWeight: FontWeight.bold)),),
                      Text('This is last message can you please tell me what to say',maxLines: 1,overflow: TextOverflow.ellipsis,style: GoogleFonts.openSans(textStyle:const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),)
                    ],),
                  ),
                ),
            );
          },itemCount: 20,)
        ],
      ),
    );
  }
}
