import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movienation/home.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'lib/assets/360_F_125579217_HL9SYmJR8KzVZ5Jfddr4BPyD3QxSSHtZ.jpg',
            height: 200,
            width: 300,
          ),
          CircularProgressIndicator(
            color: Colors.blue,
          )
        ],
      ),
    ));
  }
}
