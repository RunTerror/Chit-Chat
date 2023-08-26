import 'package:chit_chat/utils/route_names.dart';
import 'package:chit_chat/views/home/camera_screen.dart';
import 'package:chit_chat/views/home/chat_room.dart';
import 'package:chit_chat/views/home/chat_screen.dart';
import 'package:chit_chat/views/login/login_screen.dart';
import 'package:chit_chat/views/home/search_screen.dart';
import 'package:chit_chat/views/signup/signup_screen.dart';
import 'package:chit_chat/views/verification/verification_screen.dart';
import 'package:flutter/material.dart';
import '../views/home/chit_chat_screen.dart';
import '../views/landing/landing_screen.dart';

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
       return MaterialPageRoute(builder: (context)=> const SearchScreen());
      case RouteNames.loginScreen:
       return MaterialPageRoute(builder: (context)=> const LoginScreen());
      case RouteNames.signupScreen:
       return MaterialPageRoute(builder: (context)=> const SignUpScreen());
      case RouteNames.verificationScreen:
       return MaterialPageRoute(builder: (context)=> const VerificationScreen());
      default:
      return MaterialPageRoute(builder: (context)=> const Scaffold(body: Text("No valid routes"),));
    }
  }
  
}