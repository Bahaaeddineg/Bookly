import 'package:bookly/Constants/colors.dart';
import 'package:bookly/Theme/themes.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final BorderRadiusGeometry borderRadius;
  const CustomButton(
      {super.key,
      required this.bgColor,
      required this.borderRadius,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10),
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(borderRadius: borderRadius)),
      child: Text(
        text,
        style: AppTheme.textTheme.titleMedium!
            .copyWith(fontSize: 18, color: AppColors.kBlack),
      ),
    );
  }
}
