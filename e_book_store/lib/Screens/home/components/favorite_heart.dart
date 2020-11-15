import 'package:flutter/material.dart';

class FavoriteHeart extends StatelessWidget {
  const FavoriteHeart({
    Key key,
    @required this.isFavorite,
  }) : super(key: key);

  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Color(0xFFFF4444),
      ),
    );
  }
}
