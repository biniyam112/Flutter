import 'package:flutter/material.dart';
import 'package:yesefer_chwata/screens/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AudioPlayer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Muli',
        backgroundColor: Colors.white,
      ),
      home: HomeScreen(),
    );
  }
}
