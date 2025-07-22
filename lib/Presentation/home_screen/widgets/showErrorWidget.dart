import 'package:flutter/material.dart';

import '../../../Theme/themes.dart';

class MyErrorWidget extends StatelessWidget {
  final String errorMessage;
  const MyErrorWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        errorMessage,
        style: AppTheme.textTheme.titleMedium,
      ),
    );
  }
}
