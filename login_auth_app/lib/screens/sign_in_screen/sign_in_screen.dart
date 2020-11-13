import 'package:flutter/material.dart';
import 'package:login_auth_app/constants.dart';

class SignInscreen extends StatelessWidget {
  const SignInscreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/perosn.jpeg'),
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SIGN IN',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        'SIGN UP',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ],
                  ),
                  Spacer(flex: 1),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Icon(
                          Icons.alternate_email,
                          color: kPrimaryColor,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Email address',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(flex: 1),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Icon(
                          Icons.alternate_email,
                          color: kPrimaryColor,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'password',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(flex: 3),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withOpacity(.5),
                            ),
                          ),
                          child: Icon(
                            Icons.android,
                            color: Colors.white.withOpacity(.5),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withOpacity(.5),
                            ),
                          ),
                          child: Icon(
                            Icons.chat,
                            color: Colors.white.withOpacity(.5),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kPrimaryColor,
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
