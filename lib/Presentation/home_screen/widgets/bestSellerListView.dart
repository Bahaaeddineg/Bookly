import 'package:bookly/Presentation/home_screen/widgets/bestSellerItem.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  final List items;
  const BestSellerListView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => BestSellerItem(book: items[index]),
      itemCount: items.length,
    );
  }
}
