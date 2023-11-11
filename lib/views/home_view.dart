import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/views/calculator.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.red,
      body: SafeArea(
        child: Container(
          color: Colors.red,
          child:CalculatorView()
        ),
      ),
    );
  }
}
