import 'package:flutter/material.dart';
import 'package:food_app_web/screens/home/components/app_bar.dart';
import 'package:food_app_web/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            HomeAppBar(),
            Spacer(),
            BodyContent(),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
