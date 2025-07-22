import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/Data/repository/repository.dart';
import 'package:equatable/equatable.dart';

import '../../Data/Models/book_model/book_model.dart';

part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  final BooksRepo repo;
  SearchBookCubit({required this.repo}) : super(SearchBookInitial());



  
   Future<void> fetchSearchingBooks({required String title}) async {
    emit(SearchBookLoading());
      var books=await repo.fetchSearchingBooks(title: title);
      books.fold((failure) => emit(SearchBookFailure(errorMessage:failure.errorMessage )), (books) => emit(SearchBookSuccess(books: books)));
  }
}
