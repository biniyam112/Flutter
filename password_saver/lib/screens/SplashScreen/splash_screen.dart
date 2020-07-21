import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:password_saver/screens/SplashScreen/fade_animation.dart';
import 'splash_arrt.dart';

class SplashScreen extends StatelessWidget {
  final Function(int pageindex) updateParent;
  SplashScreen({@required this.updateParent});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * (0.6),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            80,
          ),
        ),
      ),
      child: new CarouselSlider.builder(
        itemCount: 3,
        initialPage: 0,
        onPageChanged: (currentpageIndex) {
          updateParent(currentpageIndex);
        },
        viewportFraction: 1.0,
        height: MediaQuery.of(context).size.height,
        aspectRatio: MediaQuery.of(context).size.aspectRatio,
        enableInfiniteScroll: false,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FadeAnimation(
                  delay: 0.8,
                  child: Center(
                    child: new Container(
                      height: MediaQuery.of(context).size.height * (0.4),
                      width: MediaQuery.of(context).size.width,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        shape: BoxShape.rectangle,
                      ),
                      child: SvgPicture.asset(
                        imagesList[index],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: new EdgeInsets.only(
                    top: 50,
                  ),
                  child: FadeAnimation(
                    delay: 0.01,
                    child: new Text(
                      message[index],
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'popinsR',
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
