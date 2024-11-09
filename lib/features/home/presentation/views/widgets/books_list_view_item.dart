import 'package:bookly_ebook_app/constants.dart';
import 'package:bookly_ebook_app/core/utils/styles.dart';
import 'package:bookly_ebook_app/core/widgets/custom_shimmer.dart';
import 'package:bookly_ebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_ebook_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class BooksListViewItem extends StatelessWidget {
  const BooksListViewItem({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.kBookDetailsView,
          extra: bookModel,
        );
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.155,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: 0.67 / 1,
                child: CachedNetworkImage(
                  imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ??
                      'https://diybookcovers.com/wp-content/uploads/2023/07/scifi4thumb.jpg',
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  placeholder: (context, url) => const CustomShimmer(width: 75, height: 120),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      '${bookModel.volumeInfo.title}',
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGTSectraFine,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      bookModel.volumeInfo.authors?[0] ?? 'Unknown',
                      style: Styles.textStyle14.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 47),
                        child: BookRating(
                          rating: bookModel.volumeInfo.averageRating ?? 0,
                          count: bookModel.volumeInfo.ratingsCount ?? 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
