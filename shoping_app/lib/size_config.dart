import 'package:flutter/material.dart';

class SizeConfig {
  static double defaultSize;
  static double screenHeight;
  static double screenWidth;
  static Orientation orientation;
  static MediaQueryData _mediaquery;

  void init(BuildContext context) {
    _mediaquery = MediaQuery.of(context);
    defaultSize = 10;
    screenHeight = _mediaquery.size.height;
    screenWidth = _mediaquery.size.width;
    orientation = _mediaquery.orientation;
  }
}

double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  return (inputHeight / 812.0) * screenHeight;
}

double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  return (inputWidth / 375.0) * screenWidth;
}
