import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FullScreenFlower extends StatelessWidget {
  final String imagePath;
  final String animationPath;

  const FullScreenFlower({
    Key? key,
    required this.imagePath,
    required this.animationPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Full-screen image
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          // Animation overlay
          Positioned.fill(
            child: Lottie.asset(
              animationPath,
              fit: BoxFit.cover,
            ),
          ),
          // Close button
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }
}
