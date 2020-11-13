import 'package:flutter/material.dart';
import 'package:login_auth_app/screens/sign_in_screen/sign_in_screen.dart';

import '../../constants.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/perosn.jpeg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'BAKING LESSON\n',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        TextSpan(
                          text: 'MASTER THE ART OF COOKING',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 200,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return SignInscreen();
                          },
                        ));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 26,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kPrimaryColor,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Start Learning',
                              style:
                                  Theme.of(context).textTheme.button.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
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
