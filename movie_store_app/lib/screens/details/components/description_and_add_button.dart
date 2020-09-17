import 'package:flutter/material.dart';
import 'package:movie_store_app/models/movie.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class DiscroptionAndAddButton extends StatelessWidget {
  const DiscroptionAndAddButton({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${movie.title}',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        fontSize: 22,
                      ),
                ),
                SizedBox(height: kDefaultPadding / 4),
                Row(
                  children: [
                    Text(
                      '${movie.year}',
                      style: TextStyle(
                        color: kTextLightColor,
                      ),
                    ),
                    SizedBox(width: kDefaultPadding / 2),
                    Text(
                      'Pg-13',
                      style: TextStyle(color: kTextLightColor),
                    ),
                    SizedBox(width: kDefaultPadding / 2),
                    Text(
                      '1 hr 47 m',
                      style: TextStyle(color: kTextLightColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(62),
            width: getProportionateScreenWidth(62),
            child: FlatButton(
              onPressed: () {},
              color: kSecondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(20),
                ),
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
