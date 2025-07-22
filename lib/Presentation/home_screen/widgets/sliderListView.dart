import 'package:flutter/material.dart';

import 'sliderItem.dart';

class SliderListView extends StatelessWidget {
  final List books;
  const SliderListView({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SliderItem(book: books[index]);
        },
        itemCount: books.length,
      ),
    );
  }
}
