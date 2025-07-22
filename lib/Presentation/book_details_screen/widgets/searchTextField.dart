import 'package:bookly/cubit/search_book/search_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Constants/colors.dart';
import '../../../Theme/themes.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: AppColors.kPink,
              spreadRadius: 6,
              blurRadius: 10,
              blurStyle: BlurStyle.solid),
        ],
        borderRadius: BorderRadius.circular(20),
        color: AppColors.kWhite,
      ),
      child: TextField(
        style: AppTheme.textTheme.titleMedium!
            .copyWith(color: AppColors.kBlack, fontSize: 20),
        onSubmitted: (value) {
          BlocProvider.of<SearchBookCubit>(context)
              .fetchSearchingBooks(title: controller.text);
        },
        controller: controller,
        cursorColor: AppColors.kPink,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          border: InputBorder.none,
          hintText: 'Enter the book title or the author',
          hintStyle: AppTheme.textTheme.titleMedium!.copyWith(
            color: AppColors.kGrey,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
