import 'package:flutter/material.dart';
import 'package:furniture_store_app/Screens/HomeScreen/home_screen.dart';
import 'package:furniture_store_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Items Store',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.dmSansTextTheme().apply(
          displayColor: kTextColor,
        ),
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: Colors.transparent,
          elevation: 0,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
