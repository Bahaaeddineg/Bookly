part of 'search_book_cubit.dart';

abstract class SearchBookState extends Equatable {
  const SearchBookState();

  @override
  List<Object> get props => [];
}

class SearchBookInitial extends SearchBookState {}
class SearchBookLoading extends SearchBookState {}
class SearchBookFailure extends SearchBookState {
  final String errorMessage;
  const SearchBookFailure({required this.errorMessage});
}
class SearchBookSuccess extends SearchBookState {
    final List<BookModel> books;
  const SearchBookSuccess({required this.books});
}
