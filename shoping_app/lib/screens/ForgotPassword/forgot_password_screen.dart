import 'package:flutter/material.dart';
import 'package:shoping_app/components/custom_appbar.dart';

import 'components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key key}) : super(key: key);
  static String routeName = '/forgot_password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'Forgot account',
        context: context,
      ),
      body: Body(),
    );
  }
}
