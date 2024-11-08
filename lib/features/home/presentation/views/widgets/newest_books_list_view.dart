import 'package:bookly_ebook_app/core/widgets/custom_error.dart';
import 'package:bookly_ebook_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_ebook_app/features/home/presentation/manager/cubits/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_ebook_app/features/home/presentation/views/widgets/books_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccessState) {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemBuilder: (context, index) => BooksListViewItem(
              bookModel: state.books[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemCount: state.books.length,
          );
        } else if (state is NewestBooksFailureState) {
          return CustomError(error: state.error);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
