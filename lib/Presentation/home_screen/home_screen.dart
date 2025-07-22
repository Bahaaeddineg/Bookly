import 'dart:ui';

import 'package:bookly/Constants/colors.dart';
import 'package:bookly/Data/api_service/api_service.dart';
import 'package:bookly/Data/repository/repository.dart';

import 'package:bookly/Presentation/home_screen/widgets/homeView.dart';
import 'package:bookly/Presentation/home_screen/widgets/searchView.dart';
import 'package:bookly/cubit/search_book/search_book_cubit.dart';
import 'package:dio/dio.dart';

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ionicons/ionicons.dart';

import 'widgets/homeAppBar.dart';

enum _SelectedTab { home, search, settings }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map> homeWidgets = [
      {
        'Widget': const HomeView(),
        'title': "Discover books",
      },
      {
        'Widget':  BlocProvider(
          create: (context) => SearchBookCubit(repo: BooksRepo(apiService: ApiService(dio: Dio()))),
          child: const SearchView(),
        ),
        'title': "Discover books",
      },
      {
        'Widget': Container(),
        'title': "Discover books",
      }
    ];
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: DotNavigationBar(
                marginR: const EdgeInsets.all(5),
                paddingR: EdgeInsets.zero,
                borderRadius: 20,
                currentIndex: _SelectedTab.values.indexOf(_selectedTab),
                backgroundColor: Colors.transparent,
                dotIndicatorColor: AppColors.kPink,
                unselectedItemColor: Colors.grey[300],
                splashBorderRadius: 50,
                onTap: _handleIndexChanged,
                items: [
                  DotNavigationBarItem(
                      icon: const Icon(Ionicons.home),
                      selectedColor: Colors.white,
                      unselectedColor: Colors.grey),
                  DotNavigationBarItem(
                      icon: const Icon(Ionicons.search),
                      selectedColor: Colors.white,
                      unselectedColor: Colors.grey),
                  DotNavigationBarItem(
                      icon: const Icon(Ionicons.settings),
                      selectedColor: Colors.white,
                      unselectedColor: Colors.grey),
                ]),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const homeAppBar(),
              homeWidgets[_SelectedTab.values.indexOf(_selectedTab)]['Widget'],
            ],
          ),
        ),
      ),
    );
  }
}
