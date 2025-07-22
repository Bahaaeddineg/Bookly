import 'package:flutter/material.dart';

import '../../../Theme/themes.dart';

class BookTitle extends StatelessWidget {
  final String bookTitle;
  const BookTitle({super.key,required this.bookTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
      child: Text(
        bookTitle,
        textAlign: TextAlign.center,
        style: AppTheme.textTheme.titleMedium,
      ),
    );
  }
}
