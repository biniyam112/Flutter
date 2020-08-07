import 'package:flutter/material.dart';
import 'package:food_app_web/constants.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.onPress,
  }) : super(key: key);
  final String text;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(25),
      ),
      child: FlatButton(
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 25,
        ),
        color: cPrimaryColor,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: onPress,
      ),
    );
  }
}
