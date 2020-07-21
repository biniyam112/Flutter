import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo list',
      home: new GamePage(),
      color: Colors.blueGrey,
    );
  }
}


class GamePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return null;
  }
}