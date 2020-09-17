import 'package:flutter/material.dart';
import 'package:shoping_app/routes.dart';
import 'package:shoping_app/screens/home/home_screen.dart';

import 'theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Store',
      theme: defaultTheme(),
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
