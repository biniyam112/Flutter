import 'package:flutter/material.dart';
import 'package:shoping_app/components/custom_appbar.dart';
import 'package:shoping_app/size_config.dart';
import 'components/body.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({Key key}) : super(key: key);
  static String routeName = '/sign_in';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'Sign in',
      ),
      body: Body(),
    );
  }
}
