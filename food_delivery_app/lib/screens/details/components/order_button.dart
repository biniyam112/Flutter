import 'package:flutter/material.dart';

import '../../../constants.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kPrimaryColor.withOpacity(.95),
        ),
        child: Row(
          children: [
            Text(
              'Order here',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
