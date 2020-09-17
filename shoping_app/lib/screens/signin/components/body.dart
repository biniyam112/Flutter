import 'package:flutter/material.dart';
import 'package:shoping_app/components/no_account_text.dart';
import 'package:shoping_app/constants.dart';
import 'package:shoping_app/size_config.dart';

import 'signin_form.dart';
import 'social_account_cart.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * .04),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Welcome to ',
                        style: TextStyle(
                          color: Color(0xFF4A4A4A),
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(28),
                        ),
                      ),
                      TextSpan(
                        text: 'Bart!',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(28),
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  'Sign in with email and password \n or continue with social media',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * .08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * .08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialAccountCard(
                      iconPath: 'assets/icons/google-icon.svg',
                      onPress: () {},
                    ),
                    SocialAccountCard(
                      iconPath: 'assets/icons/facebook-2.svg',
                      onPress: () {},
                    ),
                    SocialAccountCard(
                      iconPath: 'assets/icons/twitter.svg',
                      onPress: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                NoAccountText(),
                SizedBox(height: getProportionateScreenHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
