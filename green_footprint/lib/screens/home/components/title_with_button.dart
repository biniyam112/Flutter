import 'package:flutter/material.dart';
import 'package:green_footprint/constants.dart';

class TitlewithButton extends StatelessWidget {
  const TitlewithButton({
    Key key,
    this.title,
    this.onPreess,
  }) : super(key: key);

  final String title;
  final Function onPreess;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
      ),
      child: Row(
        children: <Widget>[
          TitleWithCustomUnderline(
            text: title,
          ),
          Spacer(),
          FlatButton(
            onPressed: onPreess,
            child: Text(
              'more',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
            color: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: kDefaultPadding / 4),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
