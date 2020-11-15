import 'package:flutter/material.dart';

class BookDescription extends StatelessWidget {
  const BookDescription({
    Key key,
    @required this.bookTitle,
    @required this.auther,
  }) : super(key: key);
  final String bookTitle, auther;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 46,
      left: 4,
      child: Container(
        width: 168,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bookTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Text(
              auther,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
