import 'package:flutter/material.dart';

import 'body.dart';

class LoginSuccesfulScreen extends StatelessWidget {
  const LoginSuccesfulScreen({Key key}) : super(key: key);
  static String routeName = '/login_success';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'LoginSuccessful'),
      body: Body(),
    );
  }
}

PreferredSizeWidget customAppBar({
  BuildContext context,
  String title,
}) {
  return PreferredSize(
    preferredSize: Size(double.infinity, kToolbarHeight * 2),
    child: SafeArea(
      minimum: EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 22),
          Spacer(),
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF6B6B6B),
              fontSize: 22,
            ),
          ),
          Spacer(),
          SizedBox(width: 24),
        ],
      ),
    ),
  );
}
