import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoping_app/models/cart.dart';
import 'package:shoping_app/size_config.dart';

import 'cart_item_cart.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                ...List.generate(carts.length, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(8)),
                    child: Dismissible(
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          carts.removeAt(index);
                        });
                      },
                      background: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFA9A9),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(16)),
                              child: SvgPicture.asset(
                                'assets/icons/Trash.svg',
                                color: Colors.white,
                                height: getProportionateScreenHeight(26),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ],
                        ),
                      ),
                      key: Key(carts[index].product.id.toString()),
                      child: CartItemCard(
                        cart: carts[index],
                      ),
                    ),
                  );
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
