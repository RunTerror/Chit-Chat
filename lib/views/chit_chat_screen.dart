import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:chit_chat/views/chat_screen.dart';
import 'package:chit_chat/views/profile_screen.dart';
import 'package:chit_chat/views/status_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChitChatScreen extends StatefulWidget {
  const ChitChatScreen({super.key});

  @override
  State<ChitChatScreen> createState() => _ChitChatScreenState();
}

class _ChitChatScreenState extends State<ChitChatScreen> {
  final _controller = NotchBottomBarController(index: 0);
  final _pageviewController = PageController(initialPage: 0);
  final screens = const [ChatScreen(), StatusScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Scaffold(
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageviewController,
              children:
                  List.generate(screens.length, (index) => screens[index]),
            ),
            extendBody: true,
            bottomNavigationBar: AnimatedNotchBottomBar(
                color: Colors.grey,
                notchColor: theme.primaryColor,
                notchBottomBarController: _controller,
                bottomBarItems: const [
                  BottomBarItem(
                      inActiveItem: Icon(
                        Icons.message_rounded,
                        color: Colors.white,
                      ),
                      activeItem: Icon(
                        Icons.message_rounded,
                        color: Colors.white,
                      )),
                  BottomBarItem(
                      inActiveItem: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      activeItem: Icon(
                        Icons.phone,
                        color: Colors.white,
                      )),
                  BottomBarItem(
                      inActiveItem: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      activeItem: Icon(
                        Icons.search_sharp,
                        color: Colors.white,
                      )),
                ],
                durationInMilliSeconds: 500,
                showShadow: false,
                onTap: (value) {
                  _controller.jumpTo(value);
                })));
  }
}
