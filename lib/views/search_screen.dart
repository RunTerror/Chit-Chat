import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class searchScreen extends StatelessWidget {
  const searchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:const Text("Search"),actions: [IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.search)), IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))],),);
  }
}