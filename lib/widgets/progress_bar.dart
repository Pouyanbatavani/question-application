import 'package:flutter/material.dart';

import '../constant.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key, required this.animation}) : super(key: key);
  final Animation animation;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.00,
      decoration: BoxDecoration(
          color: kLightBlueColor,
          borderRadius: BorderRadius.circular(10.0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: LinearProgressIndicator(
          value: animation.value,
          backgroundColor: kLightBlueColor,
          valueColor: const AlwaysStoppedAnimation(Colors.white),
        ),
      ),
    );
  }
}
