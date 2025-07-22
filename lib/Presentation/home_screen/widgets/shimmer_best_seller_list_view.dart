import 'package:bookly/Constants/colors.dart';
import 'package:bookly/Presentation/home_screen/widgets/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListView extends StatelessWidget {
  const ShimmerListView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * .15;
    return Shimmer.fromColors(
      baseColor: AppColors.kGrey,
      highlightColor: AppColors.kWhite,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(left: 20, top: 10, right: 5),
            child: Row(
              children: [
                Skeleton(
                  height: height,
                  width: height * .7,
                ),
                const SizedBox(
                  width: 12,
                ),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeleton(
                        height: 20,
                        width: 150,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Skeleton(
                        height: 15,
                        width: 170,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Skeleton(
                            height: 15,
                            width: 60,
                          ),
                          Spacer(),
                          Skeleton(
                            height: 15,
                            width: 90,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
