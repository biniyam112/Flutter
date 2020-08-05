import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_footprint/constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: kDefaultPadding * 2,
        left: kDefaultPadding * 2,
        bottom: kDefaultPadding / 2,
        top: kDefaultPadding / 2,
      ),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: kPrimaryColor.withOpacity(0.1238),
            offset: Offset(0, -10),
            blurRadius: 15,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/flower.svg',
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset('assets/icons/user-icon.svg'),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset('assets/icons/heart-icon.svg'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
