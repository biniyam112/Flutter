import 'package:flutter/material.dart';
import 'package:food_app_web/constants.dart';
import 'package:food_app_web/screens/home/home_screen.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food delivery app',
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        primaryColor: cPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
              decoration: TextDecoration.none,
            ),
      ),
      home: HomeScreen(),
    );
  }
}
