import 'package:flutter/material.dart';

String newYorkPeriodCaculator(TimeOfDay _timeOfDay) {
  if (_timeOfDay.period == DayPeriod.am) {
    return "PM";
  } else {
    return _timeOfDay.hourOfPeriod > 7 ? "PM" : 'AM';
  }
}

String newYorkHourCalculator(TimeOfDay _timeOfDay) {
  int hour;
  if (_timeOfDay.hourOfPeriod <= 7) {
    hour = _timeOfDay.hourOfPeriod + 12 - 7;
  } else {
    hour = _timeOfDay.hourOfPeriod - 7;
  }
  return hour.toString();
}

String sydneyPeriodCaculator(TimeOfDay _timeOfDay) {
  if (_timeOfDay.period == DayPeriod.am) {
    return "PM";
  } else {
    return _timeOfDay.hourOfPeriod < 5 ? "PM" : 'AM';
  }
}

String sydneyHourCalculator(TimeOfDay _timeOfDay) {
  int hour;
  if (_timeOfDay.hourOfPeriod <= 5) {
    hour = _timeOfDay.hourOfPeriod + 7;
  } else {
    hour = _timeOfDay.hourOfPeriod - 12 + 7;
  }
  return hour.toString();
}
