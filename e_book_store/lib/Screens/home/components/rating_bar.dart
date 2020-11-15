import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({
    Key key,
    @required this.rating,
  }) : super(key: key);

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 16,
          padding: EdgeInsets.only(top: (100 - rating * 10).toDouble()),
          decoration: BoxDecoration(
            color: Color(0xFFada49f),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: 16,
            decoration: BoxDecoration(
              color: Color(0xFFfcc419),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          '${rating.toString()}/10',
          style: TextStyle(
            letterSpacing: 1.5,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        Text(
          'Rating',
          style: TextStyle(
            fontSize: 12,
            color: Colors.black.withOpacity(.8),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
