import 'package:flutter/material.dart';
import 'package:shoping_app/components/custom_appbar.dart';

import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key key}) : super(key: key);
  static String routeName = '/otp';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'OTP verification',
        context: context,
      ),
      body: Body(),
    );
  }
}
