import 'package:flutter/material.dart';
import 'package:welcome_login_signup/screens/welcome/components/body.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
