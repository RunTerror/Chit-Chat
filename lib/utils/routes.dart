import 'package:chit_chat/utils/route_names.dart';
import 'package:chit_chat/views/camera_screen.dart';
import 'package:chit_chat/views/chat_room.dart';
import 'package:chit_chat/views/chat_screen.dart';
import 'package:chit_chat/views/search_screen.dart';
import 'package:flutter/material.dart';
import '../views/chit_chat_screen.dart';
import '../views/landing_screen.dart';

class Routes {

 static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name) {
      case RouteNames.landingScreen:
      return MaterialPageRoute(builder: (context)=> const LandingScreen());
      case RouteNames.chitScreen:
       return MaterialPageRoute(builder: (context)=>const ChitChatScreen());
       case RouteNames.cameraScreen:
       return MaterialPageRoute(builder: (context)=> const CameraScreen());
      case RouteNames.chatRoom:
       return MaterialPageRoute(builder: (context)=> const ChatRoom());
       case RouteNames.chatScreen:
       return MaterialPageRoute(builder: (context)=> const ChatScreen());
      case RouteNames.searchScreen:
       return MaterialPageRoute(builder: (context)=> const searchScreen());
      default:
      return MaterialPageRoute(builder: (context)=> const Scaffold(body: Text("No valid routes"),));
    }
  }
  
}