import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionWidget(),
      body: Body(),
    );
  }
}

class CustomFloatingActionWidget extends StatelessWidget {
  const CustomFloatingActionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: 72,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(.3),
        shape: BoxShape.circle,
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(40),
        child: Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 26,
          ),
        ),
      ),
    );
  }
}
