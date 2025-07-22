import 'package:bookly/Constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String? image;
  const ImageWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
        imageUrl: image!,
        fit: BoxFit.fill,
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
          color: AppColors.kWhite,
        ),
      ),
    );
  }
}
