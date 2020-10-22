import 'package:flutter/material.dart';

import '../size_config.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    Key key,
    @required this.onPress,
    @required this.iconData,
  }) : super(key: key);

  final GestureTapCallback onPress;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(44),
      width: getProportionateScreenWidth(44),
      child: FlatButton(
        padding: EdgeInsets.zero,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        onPressed: onPress,
        child: Icon(iconData),
      ),
    );
  }
}
