import 'package:flutter/material.dart';
import 'package:movie_store_app/constants.dart';
import 'package:movie_store_app/models/movie.dart';
import 'package:movie_store_app/screens/Home/components/geners.dart';
import 'package:movie_store_app/size_config.dart';

import '../backdrop_and_rating.dart';
import 'cast_and_crews.dart';
import 'description_and_add_button.dart';

class Body extends StatelessWidget {
  const Body({Key key, this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackDropAndRating(movie: movie),
          SizedBox(height: kDefaultPadding / 2),
          DiscroptionAndAddButton(movie: movie),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: kDefaultPadding / 2,
              horizontal: kDefaultPadding / 2,
            ),
            child: GenerCard(geners: movie.geners),
          ),
          SizedBox(height: kDefaultPadding),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
            ),
            child: Text(
              'Plot Summery',
              style: Theme.of(context).textTheme.headline6.copyWith(
                    fontSize: 22,
                  ),
            ),
          ),
          SizedBox(height: kDefaultPadding / 2),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
            ),
            child: Text(
              movie.plot,
              style: TextStyle(
                color: Color(0xFF737599),
                fontSize: 16,
              ),
            ),
          ),
          CastAndCrew(movie: movie),
        ],
      ),
    );
  }
}
