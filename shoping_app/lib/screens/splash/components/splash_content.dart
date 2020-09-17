import 'package:flutter/material.dart';
import 'package:shoping_app/constants.dart';
import 'package:shoping_app/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.title,
    this.imagePath,
    this.detailInto,
  }) : super(key: key);
  final String title, imagePath, detailInto;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        title.toUpperCase(),
        style: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
          fontSize: getProportionateScreenWidth(36),
        ),
      ),
      SizedBox(height: SizeConfig.defaultSize),
      Text(
        detailInto,
        textAlign: TextAlign.center,
      ),
      Spacer(flex: 2),
      Image.asset(
        imagePath,
        height: getProportionateScreenHeight(265),
        width: getProportionateScreenWidth(235),
      ),
    ]);
  }
}
