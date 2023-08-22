import 'package:chit_chat/view_model/landing_controller.dart';
import 'package:chit_chat/views/call_screen.dart';
import 'package:chit_chat/views/chat_screen.dart';
import 'package:chit_chat/views/status_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChitChatScreen extends StatefulWidget {
  const ChitChatScreen({super.key});

  @override
  State<ChitChatScreen> createState() => _ChitChatScreenState();
}

class _ChitChatScreenState extends State<ChitChatScreen> {
  final screens = const [StatusScreen(), ChatScreen(), CallScreen()];
  bool check = false;
  var index = 0;
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print('rebuild');
    FocusNode searchfocusnode=FocusNode();
    final theme = Theme.of(context);
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body: TabBarView(children: screens),
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(h / 7),
              child: Consumer<LandingProvider>(
                builder: (context, value, child) {
                  return AppBar(
                    leading: value.check == false
                        ? null
                        : IconButton(
                            onPressed: () {
                              value.toogleCheck();
                            },
                            icon: const Icon(
                              CupertinoIcons.back,
                              color: Colors.white,
                              weight: 20,
                            )),
                    actions: [
                      IconButton(
                          onPressed: () {
                            if(value.check){
                              value.toogleCheck();
                               FocusScope.of(context).requestFocus(searchfocusnode);
                            }
                            else{
                              FocusScope.of(context).unfocus();
                              value.toogleCheck();
                            }
                            
                          },
                          icon: const Icon(
                            CupertinoIcons.search,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.camera,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          )),
                    ],
                    title: value.check == false
                        ? Text(
                            "  CHITCHAT",
                            style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                          )
                        : TextField(
                          focusNode: searchfocusnode,
                            controller: _controller,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search...',
                                hintStyle: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                          ),
                    backgroundColor: theme.primaryColor,
                    bottom: TabBar(
                        indicatorWeight: 5,
                        indicatorColor:
                            const Color.fromARGB(255, 178, 173, 173),
                        tabs: [
                          Tab(
                              child: Text(
                            "Stories",
                            style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                          )),
                          Tab(
                              child: Text(
                            "Chats",
                            style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                          )),
                          Tab(
                              child: Text(
                            "Calls",
                            style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                          )),
                        ]),
                  );
                },
              ))),
    );
  }
}
