import 'package:flutter/material.dart';
import 'package:shoping_app/components/rounded_icon_button.dart';
import 'package:shoping_app/models/products.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductColorSelect extends StatelessWidget {
  const ProductColorSelect({
    Key key,
    this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    int selectedColor = 0;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: Container(
        width: double.infinity,
        height: getProportionateScreenWidth(80),
        decoration: BoxDecoration(
          color: Color(0x8FDDAAAA),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(26)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                product.colors.length,
                (index) => ColorDot(
                  color: product.colors[index],
                  onPress: (index) {
                    selectedColor = index;
                  },
                  selectedColor: selectedColor,
                  index: index,
                ),
              ),
              Spacer(),
              RoundedIconButton(
                iconData: Icons.add,
                onPress: () {},
              ),
              SizedBox(width: getProportionateScreenWidth(16)),
              RoundedIconButton(
                iconData: Icons.remove,
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorDot extends StatefulWidget {
  const ColorDot({
    Key key,
    @required this.color,
    @required this.onPress,
    @required this.index,
    @required this.selectedColor,
  }) : super(key: key);

  final Color color;
  final Function(int index) onPress;
  final int index;
  final int selectedColor;

  @override
  _ColorDotState createState() => _ColorDotState();
}

class _ColorDotState extends State<ColorDot> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onPress(widget.index);
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: getProportionateScreenWidth(4)),
        padding: EdgeInsets.all(6),
        height: getProportionateScreenWidth(38),
        width: getProportionateScreenWidth(38),
        decoration: BoxDecoration(
          // color: Colors.red,
          shape: BoxShape.circle,
          border: Border.all(
            color: (widget.index == widget.selectedColor)
                ? kPrimaryColor
                : Colors.transparent,
            width: 2,
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
