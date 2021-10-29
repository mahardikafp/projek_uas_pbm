import 'package:flutter/material.dart';
import 'package:projek_uas/pages/count.dart';
import 'package:projek_uas/pages/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      routes: {
        '/home': (BuildContext ctx) => HomeScreen(),
        '/count': (BuildContext ctx) => Count(),
      },
    );
  }
}
