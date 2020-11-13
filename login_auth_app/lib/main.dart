import 'package:flutter/material.dart';
import 'package:login_auth_app/constants.dart';
import 'package:login_auth_app/screens/intro_screen/intro_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgoundColor,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headline4: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.6,
            fontSize: 32,
          ),
          headline5: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          button: TextStyle(
            color: kPrimaryColor,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(.2),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(.2),
            ),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(.2),
            ),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(.2),
            ),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IntroScreen(),
    );
  }
}
