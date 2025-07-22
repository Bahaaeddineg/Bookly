import 'package:bookly/Data/Models/book_model/book_model.dart';
import 'package:bookly/Presentation/book_details_screen/widgets/BookDetailsAppBar.dart';
import 'package:bookly/Presentation/book_details_screen/widgets/BookTitle.dart';
import 'package:bookly/Presentation/book_details_screen/widgets/Buttons.dart';
import 'package:bookly/Presentation/book_details_screen/widgets/bookAuthor.dart';
import 'package:bookly/Presentation/book_details_screen/widgets/bookImage.dart';
import 'package:bookly/Presentation/book_details_screen/widgets/rating.dart';
import 'package:bookly/Presentation/book_details_screen/widgets/similarBooksWidget.dart';
import 'package:bookly/Presentation/home_screen/widgets/loadingWidget.dart';
import 'package:bookly/Presentation/home_screen/widgets/showErrorWidget.dart';
import 'package:bookly/cubit/similar_books/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:url_launcher/url_launcher.dart';

class BookDetailsScreen extends StatefulWidget {
  final BookModel book;
  const BookDetailsScreen({super.key, required this.book});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimilarBooksCubit>(context)
        .fetchSimilarBooks(category: widget.book.volumeInfo.categories![0]);
  }

  Future<void> _launchUrl() async {
    Uri url = Uri.parse(widget.book.volumeInfo.previewLink!);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const BookDetailsAppBar(),
          BookImage(image: widget.book.volumeInfo.imageLinks?.thumbnail ?? ''),
          BookTitle(bookTitle: widget.book.volumeInfo.title ?? ''),
          BookAuthor(bookAuthor: widget.book.volumeInfo.authorsNames()),
          BookRating(
              rating: widget.book.volumeInfo.averageRating ?? 0,
              count: widget.book.volumeInfo.ratingsCount ?? 0),
          BookDetailsButtons(
            onTap: _launchUrl,
          ),
          const Spacer(),
          BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
            builder: (context, state) {
              if (state is SimilarBooksLoading) {
                return const LoadingWidget();
              } else if (state is SimilarBooksSuccess) {
                return SimilarBooks(items: state.books);
              } else if (state is SimilarBooksFailure) {
                return MyErrorWidget(errorMessage: state.errorMessage);
              } else {
                return Container();
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}
