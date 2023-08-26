import 'dart:io';
import 'dart:math';

import 'package:chit_chat/res/components/bottom_sheet.dart';
import 'package:chit_chat/utils/route_names.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _isshowEmoji = false;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return WillPopScope(
      onWillPop: () {
        if(_isshowEmoji){
          setState(() {
            _isshowEmoji=!_isshowEmoji;
          });
          return Future.value(false);
        }
        else{
          return Future.value(true);
        }
      },
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(h / 10),
            child: AppBar(
                titleSpacing: 0,
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.cameraScreen);
                      },
                      icon: const Icon(CupertinoIcons.camera)),
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
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(
              children: [
                Expanded(
                    child: SizedBox(
                  width: w,
                  height: h,
                  child: Image.asset(
                    'assets/images/cover_chat.png',
                    fit: BoxFit.fill,
                  ),
                )),
                SizedBox(
                  width: w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: w / 1.2,
                        height: h / 15,
                        decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: (){
                                   FocusScope.of(context).unfocus();
                                  setState(() {
                                    _isshowEmoji = !_isshowEmoji;
                                  });
                                },
                                icon: const Icon(CupertinoIcons.smiley)),
                            SizedBox(
                                width: w / 2.2,
                                child: TextField(
                                  onTap: () {
                                    if(_isshowEmoji) {
                                      setState(() {
                                      _isshowEmoji=false;
                                    });
                                    }
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Type message...',
                                      hintStyle: GoogleFonts.openSans(
                                          color: Colors.white)),
                                )),
                            IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context, builder: (context) {
                                    return const Bottomsheet();
                                  },);
                                },
                                icon: const Icon(CupertinoIcons.link)),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(CupertinoIcons.photo)),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: h / 32,
                        backgroundColor: theme.primaryColor,
                        child: const Icon(Icons.send,color: Colors.white,),
                      )
                    ],
                  ),
                ),
                _isshowEmoji == true
                    ? SizedBox(
                        height: h * .35,
                        child: EmojiPicker(
                          textEditingController:
                              _textEditingController, 
                          config: Config(
                            columns: 7,
                            emojiSizeMax: 32 *
                                (Platform.isIOS
                                    ? 1.30
                                    : 1.0), 
                            initCategory: Category.RECENT,
                            recentTabBehavior: RecentTabBehavior.RECENT,
                            recentsLimit: 28,
                            noRecents: const Text(
                              'No Recents',
                              style: TextStyle(fontSize: 20, color: Colors.black26),
                              textAlign: TextAlign.center,
                            ), 
                            categoryIcons: const CategoryIcons(),
                            buttonMode: ButtonMode.MATERIAL,
                          ),
                        ),
                      )
                    : Container(),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          )),
    );
  }
}
