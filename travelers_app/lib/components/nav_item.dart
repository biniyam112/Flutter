import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../size_config.dart';

class NavItem extends StatefulWidget {
  NavItem({
    Key key,
    @required this.iconPath,
    @required this.itemTitle,
    @required this.isActive,
    @required this.screen,
    this.onPress,
  }) : super(key: key);

  final String iconPath, itemTitle;
  final bool isActive;
  final bool Function(int) onPress;
  final Widget screen;

  @override
  _NavItemState createState() => _NavItemState(
        iconPath: iconPath,
        itemTitle: itemTitle,
        onPress: onPress,
        isActive: isActive,
        screen: screen,
      );
}

class _NavItemState extends State<NavItem> {
  _NavItemState({
    this.screen,
    this.isActive,
    this.iconPath,
    this.itemTitle,
    this.onPress,
  });

  final String iconPath, itemTitle;
  bool isActive = false;
  final bool Function(int) onPress;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => screen,
            ));
      },
      child: Container(
        padding: EdgeInsets.all(5),
        height: getProportionalScreenWidth(60),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              iconPath,
              height: 26,
              color: !isActive ? kTextColor : Color(0xFFBD6A3C),
            ),
            Spacer(),
            Text(
              itemTitle,
              style: TextStyle(
                fontSize: 12,
                color: !isActive ? kTextColor : Color(0xFFBD6A3C),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
