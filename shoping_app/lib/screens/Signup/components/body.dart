import 'package:flutter/material.dart';

import 'package:shoping_app/constants.dart';
import 'package:shoping_app/screens/signin/components/social_account_cart.dart';
import 'package:shoping_app/size_config.dart';

import 'sign_up_form.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              Text(
                'Register Account ',
                style: headingStyle,
              ),
              Text(
                'Complete your details or continue \n with social media ',
                style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * .07),
              SignUpForm(),
              SizedBox(height: SizeConfig.screenHeight * .07),
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
              Text(
                'By continuing youagree with \n our terms and conditions',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
            ],
          ),
        ),
      ),
    );
  }
}
