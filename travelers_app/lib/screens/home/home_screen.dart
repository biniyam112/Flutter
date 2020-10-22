import 'package:flutter/material.dart';
import 'package:travelers_app/components/app_bar.dart';
import 'package:travelers_app/components/custon_nav_item.dart';
import 'package:travelers_app/size_config.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(isTransparent: true),
      body: Body(),
      bottomNavigationBar: CustomNavItem(),
    );
  }
}
