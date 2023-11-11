import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/views/home_view.dart';
// 2 types of widget 1. statesless widget a widget that doesnot require a mutable state
// statefull widget which require a mutable state
class myapp extends StatelessWidget {
  const myapp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Learn",
      theme:ThemeData(
        primarySwatch: Colors.orange,
      ) ,
      home:HomeView(),

    );
  }
}