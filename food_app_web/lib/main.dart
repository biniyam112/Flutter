import 'package:flutter/material.dart';
import 'package:food_app_web/constants.dart';
import 'package:food_app_web/screens/home/home_screen.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food delivery app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: cPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
