import 'package:flutter/material.dart';

import 'book_description.dart';
import 'details_and_read_buttons.dart';
import 'favorite_heart.dart';
import 'rating_bar.dart';

class BookCard extends StatefulWidget {
  BookCard({Key key}) : super(key: key);

  @override
  _BookCardState createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Container(
        height: 270,
        width: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 4),
              color: Color(0x5FDDDDDD),
              blurRadius: 20,
              spreadRadius: 6,
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 24,
              child: Image.asset(
                'assets/images/book-1.png',
                width: 152,
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: FavoriteHeart(
                      isFavorite: isFavorite,
                    ),
                  ),
                  RatingBar(rating: 7),
                ],
              ),
            ),
            BookDescription(
              bookTitle: 'Crusing and Believing',
              auther: 'Carson Wejinberg',
            ),
            DetailsAndReadButton(),
          ],
        ),
      ),
    );
  }
}
