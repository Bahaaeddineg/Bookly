import 'package:bookly/Data/Models/book_model/book_model.dart';
import 'package:bookly/Presentation/book_details_screen/widgets/rating.dart';
import 'package:bookly/Presentation/home_screen/widgets/imageWidget.dart';
import 'package:bookly/Theme/themes.dart';
import 'package:bookly/routes.dart';
import 'package:flutter/material.dart';
import '../../../Constants/colors.dart';

class BestSellerItem extends StatelessWidget {
  final BookModel book;
  const BestSellerItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * .15;
    return GestureDetector(
      onTap: () =>
          Navigator.of(context).pushNamed(AppRoutes.bdetails, arguments: book),
      child: Container(
        padding: const EdgeInsets.only(left: 20, top: 10, right: 5),
        child: Row(
          children: [
            SizedBox(
                height: height,
                width: height * .7,
                child: Hero(
                  tag: book.volumeInfo.imageLinks?.thumbnail ?? '',
                  child: ImageWidget(
                    image: book.volumeInfo.imageLinks?.thumbnail ?? '',
                  ),
                )),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(book.volumeInfo.title ?? 'Title',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.textTheme.titleMedium!
                            .copyWith(fontSize: 20)),
                  ),
                  Text(book.volumeInfo.authorsNames(),
                      style: AppTheme.textTheme.titleMedium!
                          .copyWith(fontSize: 16, color: AppColors.kGrey)),
                  Row(
                    children: [
                      Text(
                        '29\$',
                        style: AppTheme.textTheme.titleMedium!
                            .copyWith(fontSize: 20),
                      ),
                      const Spacer(),
                      BookRating(
                        count: book.volumeInfo.ratingsCount ?? 0,
                        rating: book.volumeInfo.averageRating ?? 0,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
