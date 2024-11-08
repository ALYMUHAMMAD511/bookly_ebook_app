import 'package:bookly_ebook_app/core/utils/functions/launch_custom_url.dart';
import 'package:bookly_ebook_app/core/widgets/custom_button.dart';
import 'package:bookly_ebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            onPressed: () {},
            text: 'Free',
            textColor: Colors.black,
            backgroundColor: Colors.white,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
          ),
        ),
        Expanded(
          child: CustomButton(
            onPressed: ()
            {
              launchCustomUrl(context, bookModel.volumeInfo.previewLink!);
            },
            text: bookModel.volumeInfo.previewLink == null
                ? 'Not Available'
                : 'Preview',
            textColor: Colors.white,
            fontFamily: 'Gilroy',
            fontSize: 16,
            backgroundColor: const Color(0xffEF8262),
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}
