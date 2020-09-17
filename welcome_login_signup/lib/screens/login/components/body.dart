import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:welcome_login_signup/components/default_button.dart';
import 'package:welcome_login_signup/components/password_field.dart';
import 'package:welcome_login_signup/components/user_name_field.dart';
import 'package:welcome_login_signup/constants.dart';
import 'package:welcome_login_signup/screens/signup/signup_screen.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: RotatedBox(
              quarterTurns: 0,
              child: Image.asset(
                'assets/images/main_top.png',
                height: 160,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/login_bottom.png',
              height: 120,
              color: kPrimaryColor.withOpacity(.2),
            ),
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Spacer(),
                    Text(
                      'Login'.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        letterSpacing: 1.1,
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: SvgPicture.asset('assets/icons/login.svg'),
                    ),
                    SizedBox(height: 20),
                    UsernameField(),
                    SizedBox(height: 20),
                    PasswordField(),
                    SizedBox(height: 20),
                    DefaultButton(
                      buttonColor: kPrimaryColor,
                      buttonText: 'login',
                      textColor: Colors.white,
                      press: () {},
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupScreen(),
                                ));
                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
