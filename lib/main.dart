import 'dart:js';

import 'package:burgerking/Pages/Detail.dart';
import 'package:burgerking/Pages/Flash.dart';
import 'package:burgerking/Pages/Home.dart';
import 'package:burgerking/Pages/Login.dart';
import 'package:burgerking/Pages/Preview.dart';
import 'package:burgerking/Pages/Register.dart';
import 'package:burgerking/Pages/Show.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/show': (context) => Show(),
      '/login': (context) => Login(),
      '/home': (context) => Home(),
      '/flash': (context) => Flash(),
      '/register': (context) => Register(),
      '/preview': (context) => Preview(),
      '/detail': (context) => Detail(),
      '/': (context) => Detail(),
    },
    theme: ThemeData(fontFamily: 'English'),
  ));
}
