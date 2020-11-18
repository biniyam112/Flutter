import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 60),
          child: Container(
            width: size.width / 2 - 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'cursing and influence',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '- Dale carnige',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  'this book is overrated. I\'ven\'t read it but I can tell its a bad book this book is overrated. I\can tell its a bad book for the readon of ',
                  maxLines: 5,
                  style: TextStyle(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 40,
          ),
          child: Container(
            width: size.width / 2 - 50,
            child: Image.asset(
              'assets/images/book-1.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ],
    );
  }
}
