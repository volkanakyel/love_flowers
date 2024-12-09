import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedFlower extends StatelessWidget {
  final String animationPath;

  const AnimatedFlower({Key? key, required this.animationPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 300,
        height: 300,
        child: Lottie.asset(
          animationPath,
          repeat: true,
          reverse: false,
          animate: true,
        ),
      ),
    );
  }
}
