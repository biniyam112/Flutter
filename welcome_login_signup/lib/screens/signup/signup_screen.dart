import 'package:flutter/material.dart';
import 'package:welcome_login_signup/screens/signup/components/body.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
