import 'package:flutter/material.dart';
import 'package:travelers_app/constants.dart';

AppBar buildAppBar({isTransparent = false, String title}) {
  return AppBar(
    title: Center(
      child: Text(
        title == null ? '' : title,
        style: TextStyle(
          color: kTextColor,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
    leading: GestureDetector(
      onTap: () {},
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          color: Colors.black54,
          size: 24,
        ),
      ),
    ),
    actions: [
      IconButton(
        icon: ClipOval(
          child: Image.asset('assets/images/profile.png'),
        ),
        onPressed: () {},
      ),
    ],
  );
}
