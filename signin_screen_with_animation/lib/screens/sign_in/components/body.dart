import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../size_config.dart';
import 'input_form_with_title.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Color(0xFF8C2480),
      Color(0xFFCE587D),
      Color(0xFFFF9485),
      Color(0xFFFF9485),
    ];
    return Container(
      width: double.infinity,
      height: SizeConfig.screenHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors,
        ),
      ),
      child: Stack(
        overflow: Overflow.clip,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(26)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpacing(of: 80),
                Center(
                  child: Container(
                    width: SizeConfig.screenWidth -
                        getProportionateScreenWidth(80),
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.21),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Text(
                            'Morning Theme',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            'Night Theme',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalSpacing(of: 40),
                Text(
                  'Good Morning',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 42,
                      letterSpacing: 1.1,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                VerticalSpacing(of: 10),
                Text(
                  'Enter your information below',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                VerticalSpacing(of: 54),
                InputFormWithTitle(
                  title: 'email',
                ),
                VerticalSpacing(of: 30),
                InputFormWithTitle(
                  title: 'passcode',
                  isSecret: true,
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            left: getProportionateScreenWidth(SizeConfig.screenWidth / 4),
            bottom: getProportionateScreenHeight(-100),
            duration: Duration(seconds: 3),
            curve: Curves.easeInOut,
            child: SvgPicture.asset('assets/icons/Sun.svg'),
            height: getProportionateScreenWidth(300),
            width: getProportionateScreenWidth(300),
          ),
          Positioned(
            bottom: -112,
            child: Image.asset(
              'assets/images/land_tree_light.png',
              width: SizeConfig.screenWidth,
              height: getProportionateScreenHeight(420),
              fit: BoxFit.fitHeight,
              alignment: Alignment.topCenter,
            ),
          ),
        ],
      ),
    );
  }
}
