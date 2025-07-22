import 'package:bookly/Presentation/home_screen/widgets/shimmer_best_seller_list_view.dart';
import 'package:bookly/Presentation/home_screen/widgets/shimmer_slider.dart';
import 'package:bookly/Presentation/home_screen/widgets/showErrorWidget.dart';
import 'package:bookly/Presentation/home_screen/widgets/sliderListView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Theme/themes.dart';
import '../../../cubit/books_category/book_category_cubit_cubit.dart';
import '../../../cubit/newest_books/newest_books_cubit.dart';
import 'bestSeller.dart';
import 'bestSellerListView.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<BookCategoryCubitCubit, BookCategoryCubitState>(
          builder: (context, state) {
            if (state is BookCategoryCubitSuccess) {
              return SliderListView(books: state.books);
            } else if (state is BookCategoryCubitLoading) {
              return const ShimmerSlider();
            } else if (state is BookCategoryCubitFailure) {
              return MyErrorWidget(errorMessage: state.errorMessage);
            } else {
              return Container();
            }
          },
        ),
        const BestSeller(),
        BlocBuilder<NewestBooksCubit, NewestBooksState>(
          builder: (context, state) {
            if (state is NewestBooksSuccess) {
              return BestSellerListView(items: state.books);
            } else if (state is NewestBooksLoading) {
              return const ShimmerListView();
            } else if (state is NewestBooksFailure) {
              return Text(
                state.errorMessage,
                style: AppTheme.textTheme.titleMedium,
              );
            } else {
              return Container();
            }
          },
        ),
        const SizedBox(
          height: 80,
        ),
      ],
    );
  }
}
