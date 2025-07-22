import 'package:bookly/Presentation/book_details_screen/widgets/detailsSliderItem.dart';
import 'package:bookly/Theme/themes.dart';
import 'package:flutter/material.dart';

class SimilarBooks extends StatelessWidget {
  final List items;
  const SimilarBooks({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .24,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text("You might also like...",
                    style: AppTheme.textTheme.titleSmall)),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  DetailsSliderItem(book: items[index]),
              itemCount: items.length,
            ),
          )
        ],
      ),
    );
  }
}
