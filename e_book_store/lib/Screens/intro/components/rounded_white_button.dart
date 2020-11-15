import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    @required this.buttonText,
    @required this.press,
    this.fontsize = 16,
    this.verticalPadding = 16,
  }) : super(key: key);
  final String buttonText;
  final GestureTapCallback press;
  final double verticalPadding, fontsize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(26),
      child: Container(
        alignment: Alignment.center,
        padding:
            EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 20),
        decoration: BoxDecoration(
          color: Color(0xFF615550),
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 15),
              blurRadius: 20,
              color: Color(0xFF666666).withOpacity(.2),
            ),
          ],
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: fontsize,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
