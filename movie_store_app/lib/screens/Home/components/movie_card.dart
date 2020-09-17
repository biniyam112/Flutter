import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_store_app/models/movie.dart';
import 'package:movie_store_app/screens/details/details_screen.dart';

import '../../../constants.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key key, this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: OpenContainer(
        closedElevation: 0,
        openElevation: 0,
        closedBuilder: (context, action) => buildMovieCardColumn(context),
        openBuilder: (context, action) => DetailsScreen(movie: movie),
      ),
    );
  }

  Column buildMovieCardColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(movie.coverImage),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [kDefaultShadow],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 3),
          child: Text(
            movie.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/star_fill.svg',
              height: 22,
            ),
            SizedBox(width: kDefaultPadding / 3),
            Text(
              '${movie.ratingScore}',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 16,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
