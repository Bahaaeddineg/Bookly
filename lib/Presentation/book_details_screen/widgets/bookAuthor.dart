import 'package:bookly/Constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../Theme/themes.dart';

class BookAuthor extends StatelessWidget {
  final String bookAuthor;
  const BookAuthor({super.key,required this.bookAuthor});

  @override
  Widget build(BuildContext context) {
    return Text(
      bookAuthor,
      textAlign: TextAlign.center,
      style: AppTheme.textTheme.titleMedium!
          .copyWith(color: AppColors.kGrey, fontSize: 20),
    );
  }
}
