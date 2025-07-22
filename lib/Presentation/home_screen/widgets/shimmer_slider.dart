import 'package:bookly/Presentation/home_screen/widgets/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Constants/colors.dart';

class ShimmerSlider extends StatelessWidget {
  const ShimmerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * .3;
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: Shimmer.fromColors(
        baseColor: AppColors.kGrey,
        highlightColor: AppColors.kWhite,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Skeleton(
                  height: height,
                  width: height * .7,
                ));
          },
          itemCount: 6,
        ),
      ),
    );
  }
}
