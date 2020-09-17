import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_config.dart';
import '../../../time_zone_calculator.dart';

class CountryTimeCard extends StatefulWidget {
  const CountryTimeCard({
    Key key,
    @required this.location,
    @required this.timeZone,
    @required this.iconPath,
    this.countryCode,
  }) : super(key: key);

  final String location, timeZone, iconPath;
  final int countryCode;

  @override
  _CountryTimeCardState createState() => _CountryTimeCardState(
        iconPath: iconPath,
        timeZone: timeZone,
        location: location,
        countryCode: countryCode,
      );
}

class _CountryTimeCardState extends State<CountryTimeCard> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  final String location, timeZone, iconPath;
  final int countryCode;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeOfDay.minute != TimeOfDay.now().minute) {
        setState(() {
          _timeOfDay = TimeOfDay.now();
        });
      }
    });
  }

  _CountryTimeCardState({
    this.countryCode,
    this.location,
    this.timeZone,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(20),
      ),
      child: SizedBox(
        width: getProportionateScreenWidth(233),
        child: AspectRatio(
          aspectRatio: 1.32,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Theme.of(context).primaryIconTheme.color,
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location,
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        fontSize: getProportionateScreenWidth(16),
                      ),
                ),
                SizedBox(height: 5),
                Text(
                  widget.timeZone,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      iconPath,
                      color: Theme.of(context).iconTheme.color,
                      width: getProportionateScreenWidth(60),
                      height: getProportionateScreenHeight(80),
                      fit: BoxFit.scaleDown,
                    ),
                    Spacer(),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              fontSize: 24,
                            ),
                        children: [
                          TextSpan(
                            text: countryCode == 1
                                ? newYorkHourCalculator(_timeOfDay)
                                : sydneyHourCalculator(_timeOfDay),
                          ),
                          TextSpan(text: ':'),
                          TextSpan(
                            text: '${_timeOfDay.minute}'.padLeft(2, '0'),
                          ),
                        ],
                      ),
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        countryCode == 1
                            ? newYorkPeriodCaculator(_timeOfDay)
                            : sydneyPeriodCaculator(_timeOfDay),
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              fontSize: getProportionateScreenWidth(12),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
