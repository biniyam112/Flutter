import 'package:flutter/material.dart';
import 'package:recipe_application/screens/home/home_screen.dart';
import 'package:recipe_application/screens/profile/profile_screen.dart';

class NavItem {
  final int id;
  final String icon;
  final Widget destination;

  NavItem({
    this.destination,
    this.icon,
    this.id,
  });
  bool destinationChecker() {
    if (destination != null) {
      return true;
    }
    return false;
  }
}

class NavItems extends ChangeNotifier {
  int selectedIndex = 0;
  void changeNavIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<NavItem> navItems = [
    NavItem(
      id: 1,
      icon: 'assets/icons/home.svg',
      destination: HomeScreen(),
    ),
    NavItem(
      id: 2,
      icon: 'assets/icons/list.svg',
      destination: HomeScreen(),
    ),
    NavItem(
      id: 3,
      icon: 'assets/icons/camera.svg',
      destination: HomeScreen(),
    ),
    NavItem(
      id: 4,
      icon: 'assets/icons/chef.svg',
      destination: HomeScreen(),
    ),
    NavItem(
      id: 5,
      icon: 'assets/icons/user.svg',
      destination: ProfileScreen(),
    ),
  ];
}
