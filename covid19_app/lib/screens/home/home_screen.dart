import 'package:covid19_app/screens/info/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constant.dart';
import '../../size_configuration.dart';
import 'components/app_header.dart';
import 'components/dropdown_items.dart';
import 'components/status_counter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppHeader(
              secondarPicPath: 'assets/images/virus.png',
              picpath: 'assets/icons/Drcorona.svg',
              text: 'All you have to do \nis stay at Home!',
              gotSecImage: true,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              height: getProportionateScreenHeight(60),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: DropDownItems(),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Case Update\n',
                          style: kHeadingTextStyle.copyWith(
                            color: kBodyTextColor,
                          ),
                        ),
                        TextSpan(
                          text: 'Latest Update of Covid-19',
                          style: TextStyle(
                            color: kTextLightColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return InfoScreen();
                        },
                      ));
                    },
                    child: Text(
                      'See details',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: kShadowColor,
                      offset: Offset(0, 4),
                      blurRadius: 30,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StatusCounter(
                      statusNumber: 17,
                      statusColor: kDeathColor,
                      title: 'dead',
                    ),
                    StatusCounter(
                      statusNumber: 120,
                      statusColor: kInfectedColor,
                      title: 'infected',
                    ),
                    StatusCounter(
                      statusNumber: 103,
                      statusColor: kRecovercolor,
                      title: 'recovered',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Row(
                children: [
                  Text(
                    'Spread of virus',
                    style: kHeadingTextStyle,
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return InfoScreen();
                      }));
                    },
                    child: Text(
                      'See details',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Container(
                height: getProportionateScreenHeight(180),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 6),
                      blurRadius: getProportionateScreenWidth(30),
                      color: kShadowColor,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/map.png',
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
          ],
        ),
      ),
    );
  }
}
