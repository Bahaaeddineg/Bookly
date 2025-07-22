import 'package:bookly/Constants/paddings.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../Constants/colors.dart';

class BookDetailsAppBar extends StatelessWidget {
  const BookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: appbar,
      child: Row(children: [
        GestureDetector(
          onTap: ()=>Navigator.of(context).pop(),
          child: const Icon(
            Ionicons.close,
            size: 28,
            color: AppColors.kWhite,
          ),
        ),
        const Spacer(),
        const Icon(
          Ionicons.cart_outline,
          size: 28,
          color: AppColors.kWhite,
        )
      ]),
    );
  }
}
