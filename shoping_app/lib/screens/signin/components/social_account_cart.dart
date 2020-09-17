import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class SocialAccountCard extends StatelessWidget {
  const SocialAccountCard({
    Key key,
    this.iconPath,
    this.onPress,
  }) : super(key: key);
  final String iconPath;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(10)),
        padding: EdgeInsets.all(getProportionateScreenWidth(12)),
        height: getProportionateScreenHeight(46),
        width: getProportionateScreenWidth(46),
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F9),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(iconPath),
      ),
    );
  }
}
