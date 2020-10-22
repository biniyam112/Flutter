import 'package:flutter/material.dart';

import '../../../size_config.dart';

class TravelerCard extends StatelessWidget {
  const TravelerCard({
    Key key,
    @required this.imagePath,
    @required this.userName,
  }) : super(key: key);

  final String imagePath, userName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            imagePath,
            height: getProportionalScreenWidth(80),
            width: getProportionalScreenWidth(80),
            fit: BoxFit.cover,
          ),
        ),
        VerticalSpacing(of: 10),
        Text(
          userName,
          style: TextStyle(
            fontSize: getProportionalScreenWidth(16),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
