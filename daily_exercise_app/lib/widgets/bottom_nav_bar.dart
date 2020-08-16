import 'package:daily_exercise_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 40,
      ),
      height: 60,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BottomNavItem(
            text: 'Today?',
            svgPath: 'assets/icons/calendar.svg',
            isActive: true,
            onPress: () {},
          ),
          BottomNavItem(
            text: 'gym',
            svgPath: 'assets/icons/gym.svg',
            onPress: () {},
          ),
          BottomNavItem(
            text: 'Settings',
            svgPath: 'assets/icons/Settings.svg',
            onPress: () {},
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key key,
    this.svgPath,
    this.text,
    this.onPress,
    this.isActive = false,
  }) : super(key: key);
  final String text, svgPath;
  final Function onPress;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgPath,
            color: isActive ? kActiveIconColor : kTextColor,
          ),
          SizedBox(height: 6),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isActive ? kActiveIconColor : kTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
