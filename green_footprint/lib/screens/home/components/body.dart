import 'package:flutter/material.dart';
import 'package:green_footprint/screens/home/components/featured_plants.dart';
import 'package:green_footprint/screens/home/components/header_with_searchbox.dart';
import 'package:green_footprint/screens/home/components/recomended_plants.dart';
import 'package:green_footprint/screens/home/components/title_with_button.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(),
          TitlewithButton(
            title: 'Recomended',
            onPreess: () {},
          ),
          RecomendedPlants(),
          TitlewithButton(
            title: 'fretured plants',
            onPreess: () {},
          ),
          FeaturedPlants(),
        ],
      ),
    );
  }
}
