import 'dart:async';

import 'package:flutter/material.dart';

import '../../../size_config.dart';

class DigitalTimeClock extends StatefulWidget {
  DigitalTimeClock({Key key}) : super(key: key);

  @override
  DigitalTimeClockState createState() => DigitalTimeClockState();
}

class DigitalTimeClockState extends State<DigitalTimeClock> {
  TimeOfDay _timeOfDay = TimeOfDay.now();

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

  @override
  Widget build(BuildContext context) {
    String period = _timeOfDay.period == DayPeriod.am ? "AM" : "PM";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text:
                    '${_timeOfDay.hourOfPeriod == 0 ? '12' : _timeOfDay.hourOfPeriod}:',
                style: Theme.of(context).textTheme.headline1,
              ),
              TextSpan(
                text: '${_timeOfDay.minute}'.padLeft(2, '0'),
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
        SizedBox(width: getProportionateScreenWidth(12)),
        Padding(
          padding: EdgeInsets.only(
            bottom: getProportionateScreenHeight(20),
          ),
          child: Text(
            period,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ],
    );
  }
}
