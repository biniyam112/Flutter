import 'dart:async';

import 'package:analog_watch_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'analog_timer.dart';
import 'country_time_card.dart';
import 'digital_time_clock.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: SizedBox(
          height: SizeConfig.screenHeight - getProportionateScreenHeight(100),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Addis Ababa, Ethiopia | Gmt+3',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              DigitalTimeClock(),
              Spacer(),
              AnalogTimer(),
              Spacer(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CountryTimeCard(
                      location: 'New York | USA',
                      timeZone: 'GMT-4',
                      iconPath: 'assets/icons/Liberty.svg',
                      countryCode: 1,
                    ),
                    CountryTimeCard(
                      location: 'Sydney | Australia',
                      timeZone: 'GMT+10',
                      iconPath: 'assets/icons/Sydney.svg',
                      countryCode: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
