import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

Widget listItemAnimator(Widget child, {int index = 0}) {
  return AnimationConfiguration.staggeredList(
    position: index,
    duration: const Duration(milliseconds: 500),
    child: SlideAnimation(
      verticalOffset: 50.0,
      child: FadeInAnimation(
        child: child,
      ),
    ),
  );
}
