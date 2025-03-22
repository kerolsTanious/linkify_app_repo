import 'package:flutter/material.dart';
import 'package:linkify_app/core/utils/strings_manager.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, child) {
        return Align(
          alignment: Alignment.center,
          child: SlideTransition(
            position: slidingAnimation,
            child: Text(
              StringsManager.slogan,
              style: Styles.textStyle24,
            ),
          ),
        );
      },
    );
  }
}
