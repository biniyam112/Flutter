import 'package:flutter/material.dart';
import 'package:recipe_application/components/custom_navigation_button.dart';
import 'package:recipe_application/constants.dart';
import 'package:recipe_application/size_config.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      appBar: buildAppBar(defaultSize),
      body: Body(),
      bottomNavigationBar: CustomNavigationButton(),
    );
  }

  AppBar buildAppBar(double defaultSize) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      centerTitle: true,
      leading: SizedBox(width: 10),
      title: Text('Profile'),
      actions: [
        FlatButton(
          child: Text(
            'edit',
            style: TextStyle(
              color: Colors.white,
              fontSize: defaultSize * 1.6,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
