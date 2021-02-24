import 'package:burgerking/Pages/Flash.dart';
import 'package:burgerking/Pages/Show.dart';
import 'package:flutter/material.dart';

//import 'Pages/Flash.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => Show(),
   
    },
    theme: ThemeData(fontFamily: 'English'),
  ));
}
