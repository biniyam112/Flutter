import 'package:flutter/material.dart';
import 'package:movie_store_app/models/movie.dart';
import 'package:movie_store_app/screens/details/details_screen.dart';
import 'dart:math' as math;

import '../../../constants.dart';
import 'movie_card.dart';

class MovieCarousel extends StatefulWidget {
  MovieCarousel({Key key}) : super(key: key);

  @override
  _MovieCarouselState createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  PageController _pageController;
  int initialPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: .8,
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
          controller: _pageController,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return buildMovieCardSlider(index);
          },
        ),
      ),
    );
  }

  Widget buildMovieCardSlider(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget child) {
        double value = 0;
        if (_pageController.position.haveDimensions) {
          value = index - _pageController.page;
          value = (value * .038).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: math.pi * value,
          child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return DetailsScreen(movie: movies[index]);
                  },
                ));
              },
              child: MovieCard(movie: movies[index])),
        );
      },
    );
  }
}
