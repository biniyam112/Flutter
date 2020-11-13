import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/sign_in/sign_in_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NNF',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.quicksandTextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignInScreen(),
    );
  }
}
