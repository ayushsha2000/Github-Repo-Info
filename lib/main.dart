import 'package:destini/mainPage/MainPage.dart';
import 'package:destini/mainPage/FrontPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FrontPage(),
      routes:{
        MainPage.routeName:(context)=> MainPage(),
      }
    );
  }
}
