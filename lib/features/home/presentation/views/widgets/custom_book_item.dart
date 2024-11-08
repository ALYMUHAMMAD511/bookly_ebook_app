import 'package:bookly_ebook_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_ebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem(
      {super.key, required this.aspectRatio, required this.bookModel});

  final double aspectRatio;
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: CachedNetworkImage(
          imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ??
              'https://diybookcovers.com/wp-content/uploads/2023/07/scifi4thumb.jpg',
          fit: BoxFit.fill,
          placeholder: (context, url) => const CustomLoadingIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}