import 'package:bookly_ebook_app/core/utils/app_router.dart';
import 'package:bookly_ebook_app/core/widgets/custom_error.dart';
import 'package:bookly_ebook_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_ebook_app/features/home/presentation/manager/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_ebook_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if(state is FeaturedBooksSuccessState)
        {
          return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.276,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index)
              {
                final bookModel = state.books[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 15,
                  ),
                  child: GestureDetector(
                    child: CustomBookItem(
                      bookModel: bookModel,
                      aspectRatio: 0.69 / 1,
                    ),
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kBookDetailsView,
                        extra: bookModel,
                      );
                    },
                  ),
                );
              },
              itemCount: state.books.length,
            ),
          );
        }
        else if(state is FeaturedBooksFailureState)
        {
          return CustomError(error: state.error);
        }
        else
        {
            return const CustomLoadingIndicator();
        }
      },
    );
  }
}
