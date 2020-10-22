import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class AddtoCartButton extends StatelessWidget {
  const AddtoCartButton({
    Key key,
    this.onPress,
    this.text,
  }) : super(key: key);

  final GestureTapCallback onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(26)),
      child: SizedBox(
        height: getProportionateScreenHeight(80),
        width: double.infinity,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          color: kPrimaryColor,
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
          onPressed: onPress,
        ),
      ),
    );
  }
}
