import 'package:flutter/material.dart';

import '../../../Constants/colors.dart';
import 'customButton.dart';

class BookDetailsButtons extends StatelessWidget {
  final void Function()? onTap;
  const BookDetailsButtons({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         const Expanded(
              child: CustomButton(
                  bgColor: AppColors.kWhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  text: 'Free'),
            
          ),
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: const CustomButton(
                    bgColor: AppColors.kPink,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    text: 'Free preview'),
              ),
          ),
          
        ],
      ),
    );
  }
}
