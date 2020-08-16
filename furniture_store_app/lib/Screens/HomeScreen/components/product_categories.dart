import 'package:flutter/material.dart';
import 'package:furniture_store_app/Screens/HomeScreen/components/category_card.dart';
import 'package:furniture_store_app/models/Categories.dart';

class ProductCategories extends StatelessWidget {
  const ProductCategories({
    Key key,
    @required this.categories,
  }) : super(key: key);
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          return CategoryCard(category: categories[index]);
        }),
      ),
    );
  }
}
