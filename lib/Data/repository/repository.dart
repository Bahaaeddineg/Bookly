import 'package:bookly/Data/Models/book_model/book_model.dart';
import 'package:bookly/Data/api_service/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../errors/errors.dart';

class BooksRepo {
  final ApiService apiService;
  BooksRepo({required this.apiService});

  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.getData(
          endPoint: "volumes?Filtering=free-ebooks&Sorting=newest&q=all");
      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, List<BookModel>>> fetchCategoryBooks() async {
    try {
      var data = await apiService.getData(
          endPoint: "volumes?Filtering=free-ebooks&q=Programming");
      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
  
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async {
    try {
      var data = await apiService.getData(
          endPoint: "volumes?Filtering=free-ebooks&q=$category");
      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, List<BookModel>>> fetchSearchingBooks({required String title}) async {
    try {
      var data = await apiService.getData(
          endPoint: "volumes?Filtering=&q=intitle:$title inauthor:$title");
      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
