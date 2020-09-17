import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.buttonText,
    this.buttonColor,
    this.textColor,
    this.press,
  }) : super(key: key);

  final String buttonText;
  final Color buttonColor, textColor;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: 58,
        width: size.width - 40,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            buttonText.toUpperCase(),
            style: TextStyle(
              fontSize: 16,
              letterSpacing: 1.1,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
