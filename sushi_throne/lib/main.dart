import 'package:flutter/material.dart';
import 'package:sushi_throne/screens/signup.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      // ignore: prefer_const_constructors
    const appTitle = 'form validation demo';

    return MaterialApp(
home: Scaffold(
  appBar: AppBar(title: Text(appTitle),
  ),
  body:MyCustomForm() ,
),
      );
  }
}