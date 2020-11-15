import 'package:flutter/material.dart';

import 'book_card.dart';
import 'continue_reading_card.dart';
import 'todays_best_card.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/main_page_bg.png'),
          fit: BoxFit.contain,
          alignment: Alignment.topRight,
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * .06),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  style: Theme.of(context).textTheme.headline5,
                  children: [
                    TextSpan(text: 'What do you want to read\n'),
                    TextSpan(
                      text: 'ToDaY?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    BookCard(),
                    BookCard(),
                    BookCard(),
                  ],
                ),
              ),
              SizedBox(height: 60),
              Text(
                'Today\'s Best',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              TodaysBestCard(),
              SizedBox(height: 24),
              ContinueReading(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class ContinueReading extends StatelessWidget {
  const ContinueReading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Continue Reading',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        SizedBox(height: 20),
        ContinueReadinCard(),
      ],
    );
  }
}
