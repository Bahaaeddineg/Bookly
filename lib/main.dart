import 'package:bookly/Data/api_service/api_service.dart';
import 'package:bookly/Data/repository/repository.dart';
import 'package:bookly/Theme/themes.dart';
import 'package:bookly/cubit/theme/theme_cubit.dart';
import 'package:bookly/routes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/books_category/book_category_cubit_cubit.dart';
import 'cubit/newest_books/newest_books_cubit.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      tools: const [...DevicePreview.defaultTools],
      builder: (context) => MyApp(
        routes: AppRoutes(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRoutes routes;
  const MyApp({super.key, required this.routes});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookCategoryCubitCubit>(
            create: (context) => BookCategoryCubitCubit(
                repo: BooksRepo(apiService: ApiService(dio: Dio())))
              ..fetchCategoryBooks()),
        BlocProvider<NewestBooksCubit>(
            create: (context) => NewestBooksCubit(
                repo: BooksRepo(apiService: ApiService(dio: Dio())))
              ..fetchNewestBooks()),
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit())
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
         
           return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Bookly',
            theme: state.isSwitched ? AppTheme.dark() :AppTheme.light(),
            onGenerateRoute: routes.onGenerateRoute,
          );
    
        },
      ),
    );
  }
}
