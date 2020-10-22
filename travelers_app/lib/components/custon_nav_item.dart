import 'package:flutter/material.dart';
import 'package:travelers_app/screens/chat/chat_screen.dart';
import 'package:travelers_app/screens/events/events_screen.dart';
import 'package:travelers_app/screens/home/home_screen.dart';

import '../constants.dart';
import '../size_config.dart';
import 'nav_item.dart';

class CustomNavItem extends StatelessWidget {
  const CustomNavItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionalScreenHeight(72),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItem(
                iconPath: 'assets/icons/calendar.svg',
                itemTitle: 'Events',
                isActive: false,
                screen: EventsScreen(),
                onPress: (index) {
                  return true;
                },
              ),
              NavItem(
                iconPath: 'assets/icons/friendship.svg',
                itemTitle: 'Home',
                isActive: false,
                screen: HomeScreen(),
                onPress: (index) {
                  return false;
                },
              ),
              NavItem(
                iconPath: 'assets/icons/chat.svg',
                itemTitle: 'Chat',
                isActive: false,
                screen: ChatScreen(),
                onPress: (index) {
                  return false;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
