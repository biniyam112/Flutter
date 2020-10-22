import 'package:flutter/material.dart';
import 'package:shoping_app/models/products.dart';
import 'package:shoping_app/screens/details/components/body.dart';

import 'components/custom_appbar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key key,
  }) : super(key: key);
  static String routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments arguments =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F9),
      appBar: CustonAppBar(
        rating: arguments.product.rating,
        context: arguments.context,
      ),
      body: Body(
        product: arguments.product,
      ),
    );
  }
}

class ProductDetailsArguments {
  final Product product;
  final BuildContext context;

  ProductDetailsArguments({
    @required this.context,
    @required this.product,
  });
}
