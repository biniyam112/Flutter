import 'package:e_learning_app/models/category.dart';
import 'package:e_learning_app/screens/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CourseTiles extends StatelessWidget {
  const CourseTiles({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: categories.length,
        crossAxisSpacing: getProportionateScreenWidth(16),
        mainAxisSpacing: getProportionateScreenWidth(16),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return CourseTileItem(index: index);
        },
        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      ),
    );
  }
}

class CourseTileItem extends StatelessWidget {
  const CourseTileItem({
    Key key,
    this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsScreen(category: categories[index]),
        ),
      ),
      child: Container(
        height: index.isEven
            ? getProportionateScreenHeight(240)
            : getProportionateScreenHeight(200),
        decoration: BoxDecoration(
          color: kBlueColor,
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            fit: BoxFit.fill,
            alignment: Alignment.center,
            image: AssetImage(
              categories[index].imagePath,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 6,
                left: 10,
              ),
              child: Text(
                categories[index].name.replaceRange(
                    0, 1, categories[index].name[0].toUpperCase()),
                style: kTitleTextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 6,
                left: 10,
              ),
              child: Text(
                '${categories[index].numberOfCourses} courses',
                style: kSubtitleTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
