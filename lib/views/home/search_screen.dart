import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:const Text("Search"),actions: [IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.search)), IconButton(onPressed: (){}, icon:const Icon(Icons.more_vert))],),);
  }
}