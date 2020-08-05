import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class DecelerateAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  DecelerateAnimation({this.child, this.delay});

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween(
      [
        Track('opacity').add(
          Duration(milliseconds: 100),
          Tween(begin: 0.0, end: 1.0),
        ),
        Track('translateY').add(
            Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
            curve: Curves.fastOutSlowIn),
      ],
    );
    return ControlledAnimation(
      tween: tween,
      child: child,
      delay: Duration(
        milliseconds: (500 * delay).round(),
      ),
      duration: tween.duration,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation['opacity'],
        child: Transform.translate(
          offset: Offset(
            0,
            animation['translateY'],
          ),
          child: child,
        ),
      ),
    );
  }
}