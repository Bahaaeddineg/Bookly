import 'package:bookly/Data/Models/book_model/book_model.dart';
import 'package:bookly/Data/api_service/api_service.dart';
import 'package:bookly/Data/repository/repository.dart';
import 'package:bookly/Presentation/book_details_screen/book_details_screen.dart';
import 'package:bookly/Presentation/home_screen/home_screen.dart';
import 'package:bookly/Presentation/splash_screen/splash_screen.dart';
import 'package:bookly/cubit/similar_books/similar_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static const splash = '/';
  static const home = '/home';
  static const bdetails = '/bdetails';
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case AppRoutes.bdetails:
      final book =settings.arguments as BookModel;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(create: (context)=>SimilarBooksCubit(repo: BooksRepo(apiService: ApiService(dio: Dio()))),child:  BookDetailsScreen(book: book,)));
    }
    return null;
  }
}
