import 'package:flutter/material.dart';
import 'package:shoping_app/components/custom_appbar.dart';

import 'components/body.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key key}) : super(key: key);
  static String routeName = 'sign_up';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'Sign up',
        context: context,
      ),
      body: Body(),
    );
  }
}
