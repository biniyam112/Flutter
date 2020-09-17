import 'dart:async';
import 'dart:math';

import 'package:analog_watch_app/models/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class AnalogTimer extends StatefulWidget {
  AnalogTimer({Key key}) : super(key: key);
  @override
  _AnalogTimerState createState() => _AnalogTimerState();
}

class _AnalogTimerState extends State<AnalogTimer> {
  DateTime _datetime = DateTime.now();
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_datetime != DateTime.now()) {
        setState(() {
          _datetime = DateTime.now();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 60,
                    color: kShadowColor.withOpacity(.14),
                  ),
                ],
              ),
              child: Transform.rotate(
                angle: -pi / 2,
                child: CustomPaint(
                  painter: ClockPainter(
                    context: context,
                    dateTime: _datetime,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: SizeConfig.screenWidth / 2 - 11,
          top: getProportionateScreenHeight(40),
          child: Consumer<ThemeProviderModel>(
            builder: (context, theme, child) => InkWell(
              onTap: () {
                theme.chageTheme();
              },
              child: SvgPicture.asset(
                theme.isLightTheme
                    ? 'assets/icons/Sun.svg'
                    : 'assets/icons/Moon.svg',
                width: 22,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ClockPainter extends CustomPainter {
  @override
  ClockPainter({this.dateTime, @required this.context});
  final BuildContext context;
  final DateTime dateTime;

  void paint(Canvas canvas, Size size) {
    double widthCenter = size.width / 2;
    double heightCenter = size.height / 2;
    Offset center = Offset(widthCenter, heightCenter);

    Paint _dotPainter = Paint()
      ..color = Theme.of(context).primaryIconTheme.color;
    canvas.drawCircle(center, 21, _dotPainter);
    canvas.drawCircle(
        center, 20, Paint()..color = Theme.of(context).backgroundColor);
    canvas.drawCircle(center, 10, _dotPainter);

// hour points
    double hourX = widthCenter +
        size.width *
            .28 *
            cos((dateTime.hour * 30 + dateTime.minute * .5) * pi / 180);
    double hourY = widthCenter +
        size.width *
            .28 *
            sin((dateTime.hour * 30 + dateTime.minute * .5) * pi / 180);
    // hour line
    canvas.drawLine(
      center,
      Offset(hourX, hourY),
      Paint()
        ..style = PaintingStyle.stroke
        ..color = Theme.of(context).colorScheme.secondary
        ..strokeWidth = 10,
    );
// minute points
    double minuteX =
        widthCenter + size.width * .37 * cos((dateTime.minute * 6) * pi / 180);
    double minuteY =
        widthCenter + size.width * .37 * sin((dateTime.minute * 6) * pi / 180);
// minute line
    canvas.drawLine(
      center,
      Offset(minuteX, minuteY),
      Paint()
        ..strokeWidth = 7
        ..color = Theme.of(context).accentColor,
    );
// second points
    double secondX =
        widthCenter + size.width * .4 * cos((dateTime.second * 6) * pi / 180);
    double secondY =
        heightCenter + size.height * .4 * sin((dateTime.second * 6) * pi / 180);
// second line
    canvas.drawLine(
      center,
      Offset(secondX, secondY),
      Paint()
        ..color = Theme.of(context).primaryColor
        ..strokeWidth = 3
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
