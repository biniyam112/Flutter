import 'package:flutter/material.dart';

class RecoverAccount extends StatefulWidget {
  RecoverAccount({Key key}) : super(key: key);

  @override
  _RecoverAccountState createState() => _RecoverAccountState();
}

class _RecoverAccountState extends State<RecoverAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new Container(
        decoration: new BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ],
          ),
        ),
        child: new Center(
          child: new Text(
            'this function isn\'t available yet!',
            style: new TextStyle(
              color: Colors.white,
              fontFamily: 'popinsB',
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
