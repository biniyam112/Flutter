import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screens/intro/intro_screen.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anjezib',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context)
            .textTheme
            .apply(
              displayColor: kBlackColor,
              fontFamily: GoogleFonts.poppins().fontFamily,
            )
            .copyWith(
              headline2: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IntroScreen(),
    );
  }
}
