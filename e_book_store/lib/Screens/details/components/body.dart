import 'package:e_book_store/Screens/home/components/rating_bar.dart';
import 'package:e_book_store/Screens/home/components/todays_best_card.dart';
import 'package:flutter/material.dart';

import 'book_details.dart';
import 'chapter_card.dart';
import 'read_button.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: BookDetails(size: size),
          ),
          Positioned(
            left: size.width / 2 - 10,
            top: 60,
            child: RatingBar(rating: 6),
          ),
          ReadButton(),
          Positioned(
            top: size.height * .4 - 20,
            child: BookChapters(),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: size.height * .2,
              width: size.width,
              child: TodaysBestCard(),
            ),
          ),
        ],
      ),
    );
  }
}

class BookChapters extends StatelessWidget {
  const BookChapters({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * .4 + 20,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ChapterCard(
                chapterNumber: 1,
                title: 'Money',
                subtitle: 'You dont need me to get money',
              ),
              ChapterCard(
                chapterNumber: 2,
                title: 'Time',
                subtitle: 'time is longer than you think',
              ),
              ChapterCard(
                chapterNumber: 3,
                title: 'Motive',
                subtitle: 'the wnd defines the why ',
              ),
              ChapterCard(
                chapterNumber: 4,
                title: 'Focus',
                subtitle: 'know what to prioritize',
              ),
              ChapterCard(
                chapterNumber: 5,
                title: 'Destination',
                subtitle: 'know the finish line',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
