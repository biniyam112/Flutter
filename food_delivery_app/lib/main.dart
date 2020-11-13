import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';

import 'screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taim | ጠአመ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          button: TextStyle(fontWeight: FontWeight.w800),
          headline6: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        fontFamily: 'Popins',
        scaffoldBackgroundColor: kWhiteColor,
        primaryColor: kPrimaryColor,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
