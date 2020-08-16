import 'package:daily_exercise_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExerciseItemCard extends StatelessWidget {
  const ExerciseItemCard({
    Key key,
    this.cardTitle,
    this.svgPath,
    this.onPress,
  }) : super(key: key);
  final String cardTitle, svgPath;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: kShadowColor,
            ),
          ],
        ),
        child: Material(
          child: InkWell(
            onTap: onPress,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Spacer(),
                  SvgPicture.asset(svgPath),
                  Spacer(),
                  Text(
                    cardTitle,
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 16,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
