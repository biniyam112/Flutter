import 'package:flutter/material.dart';

class SizeConfig {
  static double screenWidth, screenHeight, defaultSize;
  static Orientation orientation;
  static MediaQueryData _mediaQueryData;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    orientation = _mediaQueryData.orientation;
  }
}

double getProportionalScreenHeight(double height) {
  double screenHeight = SizeConfig.screenHeight;
  return (height / 815.0) * screenHeight;
}

double getProportionalScreenWidth(double width) {
  double screenWidth = SizeConfig.screenWidth;
  return (width / 414.0) * screenWidth;
}

class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing({
    Key key,
    this.of = 25,
  }) : super(key: key);

  final double of;
  @override
  Widget build(BuildContext context) {
    return (SizedBox(
      height: getProportionalScreenHeight(of),
    ));
  }
}
