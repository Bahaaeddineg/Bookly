part of 'book_category_cubit_cubit.dart';

abstract class BookCategoryCubitState extends Equatable {
  const BookCategoryCubitState();

  @override
  List<Object> get props => [];
}

class BookCategoryCubitInitial extends BookCategoryCubitState {}
class BookCategoryCubitLoading extends BookCategoryCubitState {}
class BookCategoryCubitFailure extends BookCategoryCubitState {
  final String errorMessage;
  const BookCategoryCubitFailure({required this.errorMessage});
}
class BookCategoryCubitSuccess extends BookCategoryCubitState {
    final List<BookModel> books;
  const BookCategoryCubitSuccess({required this.books});
}

