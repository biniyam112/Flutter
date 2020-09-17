import 'package:flutter/material.dart';
import 'package:shoping_app/components/custom_appbar.dart';

import 'components/body.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({Key key}) : super(key: key);

  static String routeName = 'complete_profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'Sign Up',
        context: context,
      ),
      body: Body(),
    );
  }
}
