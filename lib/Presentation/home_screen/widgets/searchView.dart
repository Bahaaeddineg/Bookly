import 'package:bookly/Presentation/book_details_screen/widgets/searchTextField.dart';
import 'package:bookly/Presentation/home_screen/widgets/loadingWidget.dart';
import 'package:bookly/Presentation/home_screen/widgets/searchListVIew.dart';
import 'package:bookly/cubit/search_book/search_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        const SearchTextField(),
        BlocBuilder<SearchBookCubit,SearchBookState>(builder: (context,state){
          if (state is SearchBookLoading){
            return const  LoadingWidget();
          }else if (state is SearchBookFailure){
            return Container();
          }else if (state is SearchBookSuccess){
            return SearchListView(books:state.books);
          }else {
            return Container();
          }
        } )
      ],
    );
  }
}
