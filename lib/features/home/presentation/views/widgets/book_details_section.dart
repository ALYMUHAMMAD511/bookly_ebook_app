import 'package:bookly_ebook_app/core/utils/styles.dart';
import 'package:bookly_ebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_ebook_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_ebook_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

import 'books_action.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.203,
          ),
          child: CustomBookItem(
            bookModel: bookModel,
            aspectRatio: 0.69 / 1,
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          bookModel.volumeInfo.title ?? 'Unknown',
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          bookModel.volumeInfo.authors?[0] ?? 'Unknown',
          style: Styles.textStyle18.copyWith(
            color: const Color(0XFFB7B6BC),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: bookModel.volumeInfo.averageRating ?? 0,
          count: bookModel.volumeInfo.ratingsCount ?? 0,
        ),
        const SizedBox(
          height: 37,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: BooksAction(
            bookModel: bookModel,
          ),
        ),
      ],
    );
  }
}
