import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe_application/constants.dart';
import 'package:recipe_application/models/nav_item.dart';
import 'package:recipe_application/size_config.dart';

class CustomNavigationButton extends StatelessWidget {
  const CustomNavigationButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defautSize = SizeConfig.defaultSize;
    return Consumer<NavItems>(
      builder: (context, navItems, child) => Container(
        padding: EdgeInsets.symmetric(horizontal: defautSize * 3),
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -7),
              color: Color(0xFF4B1A39).withOpacity(.2),
              blurRadius: 30,
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              navItems.navItems.length,
              (index) => buildIconNavBarButton(
                isActive: navItems.selectedIndex == index ? true : false,
                iconPath: navItems.navItems[index].icon,
                onPress: () {
                  navItems.changeNavIndex(index);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          navItems.navItems[index].destination,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  IconButton buildIconNavBarButton(
      {String iconPath, Function onPress, isActive = false}) {
    return IconButton(
      icon: SvgPicture.asset(
        iconPath,
        color: isActive ? kPrimaryColor : Color(0xFFD1D4D4),
        fit: BoxFit.cover,
        height: 22,
        width: 22,
      ),
      onPressed: onPress,
    );
  }
}
