import 'package:flutter/material.dart';

import 'components/body.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
