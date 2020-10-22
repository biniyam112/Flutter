import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelers_app/constants.dart';

import 'screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel with you',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: Colors.transparent,
          elevation: 0,
        ),
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          displayColor: kTextColor,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
