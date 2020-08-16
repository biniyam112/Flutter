import 'package:flutter/material.dart';
import 'package:online_shopping_app/constants.dart';

class CartItemCounter extends StatefulWidget {
  CartItemCounter({Key key}) : super(key: key);

  @override
  _CartItemCounterState createState() => _CartItemCounterState();
}

class _CartItemCounterState extends State<CartItemCounter> {
  int numberOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlineButton(
          icon: Icons.remove,
          onPress: () {
            setState(() {
              if (numberOfItems > 1) {
                numberOfItems--;
              }
            });
          },
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kDefaultPadding / 1.5),
          child: Text(
            numberOfItems.toString().padLeft(2, '0'),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlineButton(
          icon: Icons.add,
          onPress: () {
            setState(() {
              numberOfItems++;
            });
          },
        ),
      ],
    );
  }

  SizedBox buildOutlineButton({IconData icon, Function onPress}) {
    return SizedBox(
      height: 32,
      width: 40,
      child: OutlineButton(
        padding: EdgeInsets.all(2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        onPressed: onPress,
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
    );
  }
}
