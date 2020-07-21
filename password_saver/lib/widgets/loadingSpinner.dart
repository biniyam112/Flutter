import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget fadingcircle() {
  return Container(
    height: 280,
    width: 280,
    color: Colors.white,
    child: Center(
      child: SpinKitCircle(
        color: Colors.white,
        duration: Duration(seconds: 1),
        size: 40,
      ),
    ),
  );
}

Widget wave() {
  return Container(
    height: 20,
    color: Colors.transparent,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: new EdgeInsets.symmetric(horizontal: 10),
          child: SpinKitWave(
            color: Colors.white,
            duration: Duration(seconds: 1),
            size: 26,
            itemCount: 6,
          ),
        ),
        Padding(
          padding: new EdgeInsets.symmetric(horizontal: 10),
          child: new Text(
            'loading...',
            style: new TextStyle(
              color: Colors.white,
              fontFamily: 'HelveticaNeue',
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );
}
