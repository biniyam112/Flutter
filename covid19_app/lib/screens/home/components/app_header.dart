import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constant.dart';
import '../../../size_configuration.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    Key key,
    this.secondarPicPath,
    this.picpath,
    this.text,
    this.gotSecImage = false,
  }) : super(key: key);

  final String secondarPicPath, picpath, text;
  final bool gotSecImage;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        height: getProportionateScreenHeight(360),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ],
          ),
          image: gotSecImage
              ? DecorationImage(
                  image: AssetImage(
                    secondarPicPath,
                  ),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topRight,
                )
              : null,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              Expanded(
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Positioned(
                      left: getProportionateScreenWidth(20),
                      child: SvgPicture.asset(
                        picpath,
                        width: getProportionateScreenWidth(180),
                        alignment: Alignment.topCenter,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Positioned(
                      left: getProportionateScreenWidth(180),
                      top: getProportionateScreenHeight(52),
                      width: SizeConfig.screenWidth,
                      child: Text(
                        text,
                        style: kHeadingTextStyle.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var _path = Path();
    _path.lineTo(0, size.height - 80);
    _path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    _path.lineTo(size.width, 0);
    _path.lineTo(0, 0);
    _path.close();
    return _path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
