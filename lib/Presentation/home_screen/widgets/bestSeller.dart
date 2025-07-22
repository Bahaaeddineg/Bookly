import 'package:bookly/Theme/themes.dart';
import 'package:flutter/material.dart';

class BestSeller extends StatelessWidget {
  const BestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          "Best seller",
          style: AppTheme.textTheme.titleMedium,
        ),
      ),
    );
  }
}
