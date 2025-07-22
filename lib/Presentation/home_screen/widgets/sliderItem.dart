import 'package:bookly/Data/Models/book_model/book_model.dart';
import 'package:bookly/Presentation/home_screen/widgets/imageWidget.dart';
import 'package:bookly/routes.dart';
import 'package:flutter/material.dart';

class SliderItem extends StatelessWidget {
  final BookModel book;
  const SliderItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * .3;
    return Container(
      height: height,
      width: height * .7,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .pushNamed(AppRoutes.bdetails, arguments: book),
        child: Hero(
          tag: book.volumeInfo.imageLinks?.thumbnail ?? '',
          child: ImageWidget(
            image: book.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
      ),
    );
  }
}
