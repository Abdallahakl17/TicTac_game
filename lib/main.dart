// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'home.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
                brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor: Color(0xff00061a),
        shadowColor: Color(0xff001456),
        splashColor: Color(0xff4169e8)

      ),
      home:MyHome() ,
    );
  }
}


