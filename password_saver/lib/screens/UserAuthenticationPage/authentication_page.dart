import 'package:flutter/material.dart';
import 'pinKeypads.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthenticationPage();
  }
}

class _AuthenticationPage extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: new Container(
        child: PinPads(),
      ),
    );
  }
}
