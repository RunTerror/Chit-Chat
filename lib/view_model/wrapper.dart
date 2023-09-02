import 'package:chit_chat/view_model/user_viewmodel.dart';
import 'package:chit_chat/views/home/chit_chat_screen.dart';
import 'package:chit_chat/views/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final userprovider=Provider.of<UserViewModel>(context);
    return FutureBuilder(future: userprovider.getUser(), builder: (context, snapshot) {
      if(snapshot.connectionState==ConnectionState.waiting){
        return const Center(child: CircularProgressIndicator());
      }
      else if(snapshot.hasError){
        return Text('${snapshot.error}');
      }
      final data=snapshot.data;
      if(data!.token==null){
        return const LoginScreen();
      }
      else{
        return const ChitChatScreen();
      }
    },);
  }
}