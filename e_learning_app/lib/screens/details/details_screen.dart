import 'package:e_learning_app/models/category.dart';
import 'package:e_learning_app/size_config.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key key, this.category}) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(category: category),
    );
  }
}
