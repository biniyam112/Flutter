import 'package:flutter/material.dart';
import 'package:recipe_application/models/RecipeBundel.dart';
import 'package:recipe_application/screens/home/components/recipe_bundle_card.dart';
import 'package:recipe_application/size_config.dart';

import 'categories.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SafeArea(
      child: Column(
        children: [
          Categories(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: defaultSize * 2,
                  crossAxisSpacing:
                      SizeConfig.orientation == Orientation.landscape
                          ? defaultSize * 2
                          : 0,
                  childAspectRatio: 1.65,
                  crossAxisCount:
                      SizeConfig.orientation == Orientation.landscape ? 2 : 1,
                ),
                itemCount: recipeBundles.length,
                itemBuilder: (context, index) => RecipeBundleCard(
                  index: index,
                  press: () {},
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
