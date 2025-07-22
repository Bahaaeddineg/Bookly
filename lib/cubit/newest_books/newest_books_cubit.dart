import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Data/Models/book_model/book_model.dart';
import '../../Data/repository/repository.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  final BooksRepo repo;
  NewestBooksCubit({required this.repo}) : super(NewestBooksInitial());


   Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
      var books=await repo.fetchNewestBooks();
      books.fold((failure) => emit(NewestBooksFailure(errorMessage:failure.errorMessage )), (books) => emit(NewestBooksSuccess(books: books)));
  }
}
