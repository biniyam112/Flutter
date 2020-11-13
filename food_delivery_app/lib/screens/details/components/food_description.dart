import 'package:flutter/material.dart';

class FoodDescription extends StatelessWidget {
  const FoodDescription({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        'I ma the lorem ipsum of this pc. since I can\'t find some thing to fill this text with Im going to do it on my own you have to buy this vegiterian salsd cause you are awesome and naive I ma the lorem ipsum of this pc. since I can\'t find some thing to fill this text with Im going to do it on my own you have to buy this vegiterian salsd cause you are awesome and naive',
        maxLines: 8,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
