import 'package:flutter/material.dart';

import 'category_item.dart';
import 'geners.dart';

import 'movie_carousel.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryItem(),
        GenerCard(
          geners: [
            'action',
            'romance',
            'comedy',
            'horor',
            'sy-fy',
          ],
        ),
        MovieCarousel(),
      ],
    );
  }
}
