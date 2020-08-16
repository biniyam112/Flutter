import 'package:flutter/material.dart';
import 'package:furniture_store_app/Screens/HomeScreen/components/product_categories.dart';
import 'package:furniture_store_app/Screens/HomeScreen/components/recomeneded_products.dart';
import 'package:furniture_store_app/components/title_text.dart';
import 'package:furniture_store_app/services/fetchCategories.dart';
import 'package:furniture_store_app/services/fetchProducts.dart';
import 'package:furniture_store_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: TitleText(title: 'Browse by categories'),
            ),
            FutureBuilder(
                future: fetchCategories(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ProductCategories(categories: snapshot.data)
                      : Center(child: Image.asset('assets/ripple.gif'));
                }),
            Divider(height: 5),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: TitleText(title: 'Recomended for you'),
            ),
            FutureBuilder(
                future: fetchProducts(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? RecomendedProducts(products: snapshot.data)
                      : Center(child: Image.asset('assets/ripple.gif'));
                }),
          ],
        ),
      ),
    );
  }
}
