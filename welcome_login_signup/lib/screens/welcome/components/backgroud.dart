import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  const BackGround({@required this.bodyContent});

  final Widget bodyContent;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/main_top.png',
              width: _size.width * .3,
            ),
          ),
          Positioned(
            bottom: -60,
            left: 0,
            child: Image.asset(
              'assets/images/main_bottom.png',
              width: _size.width * .3,
            ),
          ),
          bodyContent,
        ],
      ),
    );
  }
}
