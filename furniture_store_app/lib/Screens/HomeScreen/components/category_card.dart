import 'package:flutter/material.dart';
import 'package:furniture_store_app/components/title_text.dart';
import 'package:furniture_store_app/constants.dart';
import 'package:furniture_store_app/models/Categories.dart';
import 'package:furniture_store_app/models/Product.dart';
import 'package:furniture_store_app/size_config.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key key, @required this.category}) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    return Padding(
      padding: EdgeInsets.all(defaultSize * 2),
      child: SizedBox(
        height: defaultSize * 21.5,
        child: AspectRatio(
          aspectRatio: .85,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipPath(
                clipper: CategoriyCustomShape(),
                child: AspectRatio(
                  aspectRatio: 1.025,
                  child: Container(
                    color: kSecondaryColor,
                    padding: EdgeInsets.all(defaultSize * 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TitleText(title: category.title),
                        SizedBox(height: defaultSize / 1.5),
                        Text('${category.numOfProducts}+ Products')
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: AspectRatio(
                  aspectRatio: 1.15,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/spinner.gif',
                    image: category.image,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriyCustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double height = size.height;
    double width = size.width;
    double borderRadius = 30;

    path.lineTo(0, height - borderRadius);
    path.quadraticBezierTo(0, height, borderRadius, height);
    path.lineTo(width - borderRadius, height);
    path.quadraticBezierTo(width, height, width, height - borderRadius);
    path.lineTo(width, borderRadius);
    path.quadraticBezierTo(width, 0, width - borderRadius, borderRadius * .2);
    path.lineTo(borderRadius, borderRadius * .75);
    path.quadraticBezierTo(0, borderRadius, 0, borderRadius * 2);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
