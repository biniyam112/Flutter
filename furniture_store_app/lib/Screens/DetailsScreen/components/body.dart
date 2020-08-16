import 'package:flutter/material.dart';
import 'package:furniture_store_app/Screens/DetailsScreen/components/product_description_and_button.dart';
import 'package:furniture_store_app/Screens/DetailsScreen/components/product_text_info.dart';
import 'package:furniture_store_app/models/Product.dart';
import 'package:furniture_store_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key, this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.orientation == Orientation.landscape
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight - AppBar().preferredSize.height,
        child: Stack(
          children: [
            ProductInfo(product: product),
            Positioned(
              top: defaultSize * 37.5,
              left: 0,
              right: 0,
              child: ProductDescriptionandButton(
                product: product,
                onPress: () {},
              ),
            ),
            Positioned(
              top: defaultSize * 9,
              right: -defaultSize * 7.6,
              child: Hero(
                tag: product.id,
                child: Image.network(
                  product.image,
                  height: defaultSize * 37.8,
                  width: defaultSize * 34,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
