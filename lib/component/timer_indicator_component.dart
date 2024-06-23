import 'package:flutter/material.dart';

Widget timerIndicatorComponent(AnimationController controller) {
  return Center(
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: AspectRatio(
              aspectRatio: 1.0,
              child: CircularProgressIndicator(
                  value: controller.value,
                  semanticsLabel: 'Circular progress indicator'))));
}
