import 'package:flutter/material.dart';
import 'package:movie_store_app/models/movie.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'cast_card.dart';

class CastAndCrew extends StatefulWidget {
  CastAndCrew({Key key, this.movie}) : super(key: key);
  final Movie movie;
  @override
  _CastAndCrewState createState() => _CastAndCrewState(movie: movie);
}

class _CastAndCrewState extends State<CastAndCrew> {
  final Movie movie;

  _CastAndCrewState({this.movie});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: [
          Text(
            'Cast and Crews',
            style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: 22,
                ),
          ),
          SizedBox(height: kDefaultPadding),
          SizedBox(
            height: getProportionateScreenHeight(200),
            child: ListView.builder(
              itemCount: movie.cast.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CastCard(cast: movie.cast[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
