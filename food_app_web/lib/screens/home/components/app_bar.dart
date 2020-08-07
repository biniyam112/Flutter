import 'package:flutter/material.dart';
import 'package:food_app_web/screens/home/components/app_bar_button.dart';
import 'package:food_app_web/screens/home/components/default_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(48),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 30,
            color: Colors.black.withOpacity(0.16),
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 25,
            alignment: Alignment.topCenter,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'e-FOOD',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          AppBarButton(
            title: 'Home',
            onPress: () {},
          ),
          AppBarButton(
            title: 'about',
            onPress: () {},
          ),
          AppBarButton(
            title: 'Pricing',
            onPress: () {},
          ),
          AppBarButton(
            title: 'Contact',
            onPress: () {},
          ),
          AppBarButton(
            title: 'Login',
            onPress: () {},
          ),
          DefaultButton(
            text: 'get started',
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
