import 'package:flutter/material.dart';
import 'package:trakify/core/constants/assets.dart';

class BgShape extends StatelessWidget {
  const BgShape({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Image.asset(Assets.imagesShapesTop),
        ),

        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(Assets.imagesShapesBottom),
        ),
        SafeArea(child: child),
      ],
    );
  }
}
