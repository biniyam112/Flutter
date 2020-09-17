import 'package:flutter/material.dart';
import 'package:shoping_app/constants.dart';
import 'package:shoping_app/size_config.dart';

import 'otp_form.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * .05),
              Text(
                'Verify phone number',
                style: headingStyle,
              ),
              Text('We send your code to +1 *** *** 245'),
              buildTimer(),
              SizedBox(height: SizeConfig.screenHeight * .15),
              OptForm(),
              SizedBox(height: SizeConfig.screenHeight * .1),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Resent OTP code',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('This code will expire in '),
        TweenAnimationBuilder(
          tween: Tween(begin: 30, end: 0),
          duration: Duration(seconds: 30),
          builder: (context, value, child) {
            return Text(
              '00:${value.toInt().toString().padLeft(2, '0')}',
              style: TextStyle(
                color: kPrimaryColor,
              ),
            );
          },
          onEnd: () {},
        ),
      ],
    );
  }
}
