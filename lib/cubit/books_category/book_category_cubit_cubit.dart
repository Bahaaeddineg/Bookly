import 'package:bookly/Data/Models/book_model/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Data/repository/repository.dart';

part 'book_category_cubit_state.dart';

class BookCategoryCubitCubit extends Cubit<BookCategoryCubitState> {
  final BooksRepo repo;
  BookCategoryCubitCubit({required this.repo}) : super(BookCategoryCubitInitial());


  Future<void> fetchCategoryBooks() async {
      emit(BookCategoryCubitLoading());
      var books=await repo.fetchCategoryBooks();
      books.fold((failure) => emit(BookCategoryCubitFailure(errorMessage:failure.errorMessage )), (books) => emit(BookCategoryCubitSuccess(books: books)));
  }
}
