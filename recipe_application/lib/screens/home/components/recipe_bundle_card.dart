import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_application/models/RecipeBundel.dart';

import '../../../size_config.dart';

class RecipeBundleCard extends StatelessWidget {
  const RecipeBundleCard({Key key, this.index, this.press}) : super(key: key);
  final int index;
  final Function press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultSize * 2),
          color: recipeBundles[index].color,
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(defaultSize * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Text(
                      recipeBundles[index].title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: defaultSize * 2.2,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: defaultSize * .8),
                    Text(
                      recipeBundles[index].description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white54,
                      ),
                    ),
                    Spacer(),
                    buildRecipeInfoRow(
                      iconPath: 'assets/icons/chef.svg',
                      text: '${recipeBundles[index].chefs} Chefs ',
                    ),
                    SizedBox(height: defaultSize),
                    buildRecipeInfoRow(
                      iconPath: 'assets/icons/pot.svg',
                      text: '${recipeBundles[index].recipes} Recipies ',
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            SizedBox(width: defaultSize),
            AspectRatio(
              aspectRatio: .71,
              child: Image.asset(
                recipeBundles[index].imageSrc,
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildRecipeInfoRow({String iconPath, String text}) {
    double defaultSize = SizeConfig.defaultSize;
    return Row(
      children: [
        SvgPicture.asset(iconPath),
        SizedBox(width: defaultSize),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            letterSpacing: defaultSize * .1,
          ),
        ),
      ],
    );
  }
}
