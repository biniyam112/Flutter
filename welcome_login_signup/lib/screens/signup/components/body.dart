import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:welcome_login_signup/components/default_button.dart';
import 'package:welcome_login_signup/components/password_field.dart';
import 'package:welcome_login_signup/components/user_name_field.dart';
import 'package:welcome_login_signup/constants.dart';
import 'package:welcome_login_signup/screens/login/login_screen.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            'assets/images/signup_top.png',
            height: 120,
          ),
        ),
        SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: size.height,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Spacer(),
                    Center(
                      child: Text(
                        'sign up'.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SvgPicture.asset(
                      'assets/icons/signup.svg',
                      height: 200,
                    ),
                    SizedBox(height: 20),
                    UsernameField(),
                    SizedBox(height: 20),
                    PasswordField(),
                    SizedBox(height: 20),
                    DefaultButton(
                      buttonColor: kPrimaryColor,
                      buttonText: 'Sign up',
                      press: () {},
                      textColor: Colors.white,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              )),
                          child: Text(
                            'Log in',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            color: kPrimaryColor,
                            thickness: 1,
                            indent: 60,
                            endIndent: 10,
                          ),
                        ),
                        Text(
                          'OR',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: kPrimaryColor,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: kPrimaryColor,
                            thickness: 1,
                            indent: 10,
                            endIndent: 60,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialMediaCard(imagePath: 'assets/icons/facebook.svg'),
                        SizedBox(width: 20),
                        SocialMediaCard(
                            imagePath: 'assets/icons/google-plus.svg'),
                        SizedBox(width: 20),
                        SocialMediaCard(imagePath: 'assets/icons/twitter.svg'),
                      ],
                    ),
                    SizedBox(height: 20),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.asset(
            'assets/images/main_bottom.png',
            height: 100,
          ),
        ),
      ],
    );
  }
}

class SocialMediaCard extends StatelessWidget {
  const SocialMediaCard({
    Key key,
    @required this.imagePath,
  }) : super(key: key);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      padding: EdgeInsets.all(17),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: kPrimaryColor.withOpacity(.4),
          width: 1,
        ),
      ),
      child: SvgPicture.asset(
        imagePath,
        color: kPrimaryColor,
      ),
    );
  }
}
