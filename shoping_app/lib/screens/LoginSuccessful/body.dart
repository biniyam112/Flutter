import 'package:flutter/material.dart';
import 'package:shoping_app/components/default_button.dart';
import 'package:shoping_app/screens/home/home_screen.dart';
import 'package:shoping_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * .08),
        Image.asset(
          'assets/images/success.png',
          height: SizeConfig.screenHeight * .4,
        ),
        SizedBox(height: SizeConfig.screenHeight * .08),
        Text(
          'Login Successful',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(30),
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * .6,
          child: DefaultButton(
              buttonText: 'Return to Home',
              onPress: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              }),
        ),
        Spacer(),
      ],
    );
  }
}
