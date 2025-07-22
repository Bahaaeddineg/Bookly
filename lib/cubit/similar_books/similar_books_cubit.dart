import 'package:bookly/Data/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/Data/Models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  final BooksRepo repo;

  SimilarBooksCubit({required this.repo,}) : super(SimilarBooksInitial());

   Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
      var books=await repo.fetchSimilarBooks(category: category);
      books.fold((failure) => emit(SimilarBooksFailure(errorMessage:failure.errorMessage )), (books) => emit(SimilarBooksSuccess(books: books)));
  }

}
