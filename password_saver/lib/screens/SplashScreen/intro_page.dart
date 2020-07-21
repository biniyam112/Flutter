import 'package:flutter/material.dart';
import 'package:password_saver/screens/SplashScreen/splash_arrt.dart';
import 'package:password_saver/screens/SplashScreen/splash_screen.dart';
import 'package:password_saver/screens/loginPage/decelerate_animation.dart';
import 'package:password_saver/screens/loginPage/signupPage.dart';
import 'dotted_progress.dart';

class IntroPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IntroPageP();
  }
}

class IntroPageP extends State {
  int pageindex = 0;
  updateWidget(dynamic pageindex) {
    setState(() {
      this.pageindex = pageindex;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('\n\n\nin intro page');
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: new BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF3383CD),
            Color(0xFF11249F),
          ],
        ),
      ),
      // the upper text
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * (1 / 4),
            child: Center(
              child: DecelerateAnimation(
                delay: 3.5,
                child: new Text(
                  title[pageindex],
                  style: new TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontFamily: 'popinsB',
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ),
          // the splash screen
          SplashScreen(
            updateParent: updateWidget,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              DottedProgress(pageindex),
              new Padding(
                padding: new EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: new ButtonTheme(
                  height: 48,
                  minWidth: MediaQuery.of(context).size.width - 100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: new RaisedButton(
                    color: Color(0xFFFF9000),
                    disabledColor: Color(0x5F000000),
                    onPressed: (pageindex == 2)
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return SignUpPage();
                              }),
                            );
                          }
                        : null,
                    child: new Text(
                      'Get started',
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: 'popinsR',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
