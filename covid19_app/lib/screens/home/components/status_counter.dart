import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../size_configuration.dart';

class StatusCounter extends StatelessWidget {
  const StatusCounter({
    Key key,
    this.statusNumber,
    this.title,
    this.statusColor,
  }) : super(key: key);

  final int statusNumber;
  final String title;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(getProportionateScreenWidth(6)),
          height: getProportionateScreenHeight(24),
          width: getProportionateScreenWidth(24),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: statusColor.withOpacity(.36),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: statusColor,
                width: 2,
              ),
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(10)),
        Text(
          '${statusNumber}M',
          style: TextStyle(
            color: statusColor,
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          title,
          style: kSubTextStyle.copyWith(color: kBodyTextColor),
        ),
      ],
    );
  }
}
