import 'package:flutter/material.dart';

import 'package:movienation/splash_screen.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: splash_screen(),
    );
  }
}
