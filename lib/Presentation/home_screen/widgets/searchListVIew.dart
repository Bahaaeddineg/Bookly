import 'package:bookly/Data/Models/book_model/book_model.dart';
import 'package:bookly/Presentation/home_screen/widgets/bestSellerItem.dart';
import 'package:flutter/material.dart';

class SearchListView extends StatelessWidget {
  final List<BookModel> books;
  const SearchListView({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) => BestSellerItem(book: books[index]),
      itemCount: books.length,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
