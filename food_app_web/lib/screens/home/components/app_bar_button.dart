import 'package:flutter/material.dart';
import 'package:food_app_web/constants.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    Key key,
    this.title,
    this.onPress,
  }) : super(key: key);
  final String title;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: cTextColor.withOpacity(0.51),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
