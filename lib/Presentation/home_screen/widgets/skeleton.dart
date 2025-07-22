import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({required this.height, required this.width});

  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
