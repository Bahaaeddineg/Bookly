import 'package:bookly/Data/Models/book_model/book_model.dart';
import 'package:bookly/Presentation/home_screen/widgets/imageWidget.dart';
import 'package:flutter/material.dart';

class DetailsSliderItem extends StatelessWidget {
  final BookModel book;
  const DetailsSliderItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * .25;

    return Container(
      height: height,
      width: height * .6,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: ImageWidget(image: book.volumeInfo.imageLinks?.thumbnail ?? '' ),
    );
  }
}
