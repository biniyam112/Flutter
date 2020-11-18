import 'package:flutter/material.dart';

class ReadButton extends StatelessWidget {
  const ReadButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 34,
      right: 40,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          decoration: BoxDecoration(
            color: Color(0xff444444),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'Read',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
