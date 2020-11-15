import 'package:e_book_store/Screens/home/home_screen.dart';
import 'package:flutter/material.dart';

import 'rounded_white_button.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Bitmap.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Anjezib',
                  style: Theme.of(context).textTheme.headline5,
                ),
                TextSpan(
                  text: 'GO!',
                  style: Theme.of(context).textTheme.headline3.copyWith(),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 200,
            child: RoundedButton(
              buttonText: 'Start Reading',
              fontsize: 18,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
