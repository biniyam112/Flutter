import 'package:flutter/material.dart';

ThemeData myApptheme() {
  return ThemeData(
    primaryColor: Colors.blue,
    accentColor: Colors.black87,
    buttonColor: Colors.black87,
    textTheme: new TextTheme(
      button: new TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
    ),
  );
}
