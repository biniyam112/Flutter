import 'package:flutter/material.dart';
import 'package:furniture_store_app/Screens/DetailsScreen/details_screen.dart';
import 'package:furniture_store_app/Screens/HomeScreen/components/product_cart.dart';
import 'package:furniture_store_app/models/Product.dart';
import 'package:furniture_store_app/size_config.dart';

class RecomendedProducts extends StatelessWidget {
  const RecomendedProducts({
    Key key,
    @required this.products,
  }) : super(key: key);
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.all(defaultSize * 2),
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: defaultSize * 2,
            crossAxisSpacing: defaultSize * 2,
            crossAxisCount:
                SizeConfig.orientation == Orientation.landscape ? 4 : 2,
            childAspectRatio: .693,
          ),
          itemBuilder: (context, index) {
            return ProductCard(
              product: products[index],
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailsScreen(
                    product: products[index],
                  );
                }));
              },
            );
          }),
    );
  }
}
