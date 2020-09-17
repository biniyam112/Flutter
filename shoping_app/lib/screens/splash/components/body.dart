import 'package:flutter/material.dart';
import 'package:shoping_app/components/default_button.dart';
import 'package:shoping_app/constants.dart';
import 'package:shoping_app/screens/signin/sign_in_screen.dart';
import 'package:shoping_app/size_config.dart';

import 'splash_content.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      'title': 'Bart',
      'text': 'Welcome to ${'Bart'.toUpperCase()} Lets shop now!',
      'image': 'assets/images/splash_1.png'
    },
    {
      'title': 'Easy Shop',
      'text': 'We help people conect with store \naround the world',
      'image': 'assets/images/splash_2.png'
    },
    {
      'title': 'Get started!',
      'text': 'We show the easy way to shop. \nJust stay at home with us',
      'image': 'assets/images/splash_3.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(children: [
          Spacer(),
          Expanded(
            flex: 3,
            child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) {
                  return SplashContent(
                    title: splashData[index]['title'],
                    detailInto: splashData[index]['text'],
                    imagePath: splashData[index]['image'],
                  );
                }),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    splashData.length,
                    (index) {
                      return buildDot(index: index);
                    },
                  ),
                ),
                Spacer(
                  flex: 3,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: DefaultButton(
                    buttonText: 'Continue',
                    onPress: () {
                      Navigator.pushNamed(context, SigninScreen.routeName);
                    },
                  ),
                ),
                Spacer(flex: 2),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: (currentPage == index) ? 18 : 6,
      decoration: BoxDecoration(
        color: (currentPage == index) ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
