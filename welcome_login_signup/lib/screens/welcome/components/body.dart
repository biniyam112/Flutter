import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:welcome_login_signup/components/default_button.dart';
import 'package:welcome_login_signup/constants.dart';
import 'package:welcome_login_signup/screens/login/login_screen.dart';
import 'package:welcome_login_signup/screens/signup/signup_screen.dart';

import 'backgroud.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackGround(
      bodyContent: SafeArea(
        child: BodyContent(),
      ),
    );
  }
}

class BodyContent extends StatelessWidget {
  const BodyContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(
          child: Text(
            'Welcome to | Cortex'.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
        ),
        SvgPicture.asset('assets/icons/chat.svg'),
        Column(
          children: [
            DefaultButton(
              buttonText: 'Login',
              buttonColor: kPrimaryColor,
              textColor: Colors.white,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            DefaultButton(
              buttonText: 'sign up',
              buttonColor: Color(0xAFCFADED),
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignupScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
