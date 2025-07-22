
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../Constants/colors.dart';
import '../../../Theme/themes.dart';

class BookRating extends StatelessWidget {
  final num rating;
  final int count;
  const BookRating({super.key,required this.rating,required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Ionicons.star,
          color: AppColors.kYellow,
          size: 30,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
         '$rating/5',
          style: AppTheme.textTheme.titleMedium!.copyWith(fontSize: 16),
        ),
        Text(
          " ($count)",
          style: AppTheme.textTheme.titleMedium!
              .copyWith(fontSize: 14, color: AppColors.kWhite.withOpacity(0.4)),
        ),
      ],
    );
  }
}
