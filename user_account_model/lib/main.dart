import 'package:flutter/material.dart';
import './screens/userPage.dart';

main(List<String> args) {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: UserPage(),
      ),
    );
  }
}
