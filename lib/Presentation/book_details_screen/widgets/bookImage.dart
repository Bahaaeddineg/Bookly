import 'package:bookly/Presentation/home_screen/widgets/imageWidget.dart';
import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  final String image;

  const BookImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * .34;
    return Center(
      child: SizedBox(
        height: height,
        width: height * .7,
        child: Hero(tag: image,child: ImageWidget(image: image)),
      ),
    );
  }
}
