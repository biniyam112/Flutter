import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_footprint/constants.dart';

class IconsCard extends StatelessWidget {
  const IconsCard({
    Key key,
    this.iconPath,
  }) : super(key: key);
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
      padding: EdgeInsets.all(kDefaultPadding / 2),
      height: 58,
      width: 58,
      decoration: BoxDecoration(
        color: kBackGroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
        boxShadow: [
          BoxShadow(
            color: kPrimaryColor.withOpacity(0.0812),
            offset: Offset(0, 15),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-15, -15),
            blurRadius: 10,
          ),
        ],
      ),
      child: IconButton(
        icon: SvgPicture.asset(iconPath),
        onPressed: () {},
      ),
    );
  }
}
