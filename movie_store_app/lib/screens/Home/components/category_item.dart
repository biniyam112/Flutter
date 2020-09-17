import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CategoryItem extends StatefulWidget {
  CategoryItem({Key key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryItem> {
  int selectedCategory = 0;
  List<String> categories = [
    'Box Office',
    'Comming Soon',
    'Trending',
    'On Theater'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: getProportionateScreenHeight(60),
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return buildCategoryText(index: index, context: context);
        },
      ),
    );
  }

  Widget buildCategoryText({int index, BuildContext context}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = index;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style:
                  Theme.of(context).textTheme.headline6.copyWith(fontSize: 22),
            ),
            selectedCategory == index
                ? Container(
                    margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 3),
                    height: 4,
                    width: 60,
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )
                : SizedBox(height: 4)
          ],
        ),
      ),
    );
  }
}
