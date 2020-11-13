import 'package:flutter/material.dart';

import '../../../constants.dart';

class FoodTitleWithPrice extends StatelessWidget {
  const FoodTitleWithPrice({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              text: 'Vegan salad bowl\n',
              style: Theme.of(context).textTheme.headline6,
              children: [
                TextSpan(
                  text: 'with beef meat',
                  style: TextStyle(
                    color: Colors.black.withOpacity(.3),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '\$40',
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: kPrimaryColor),
          ),
        ],
      ),
    );
  }
}
