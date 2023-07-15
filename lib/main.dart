import 'package:flutter/material.dart';
import 'package:suitmedia/screens/firstscreen.dart';
import 'package:suitmedia/screens/secondscreen.dart';
import 'package:suitmedia/screens/thirdscreen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ThirdScreen(),
    );
  }
}