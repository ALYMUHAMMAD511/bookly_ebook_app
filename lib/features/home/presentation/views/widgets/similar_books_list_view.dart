import 'package:bookly_ebook_app/core/utils/app_router.dart';
import 'package:bookly_ebook_app/core/widgets/custom_error.dart';
import 'package:bookly_ebook_app/features/home/presentation/manager/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_ebook_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_ebook_app/features/home/presentation/views/widgets/custom_books_shimmer/custom_books_shimmer_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccessState)
        {
          return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.15,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: GestureDetector(
                      child: CustomBookItem(
                        bookModel: state.bookModel[index],
                        aspectRatio: 62.5 / 100,
                      ),
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kBookDetailsView,
                          extra: state.bookModel[index],
                        );
                      },
                    ),
                  ),
              itemCount: state.bookModel.length,
            ),
          );
        }
        else if (state is SimilarBooksFailureState)
        {
          return CustomError(error: state.error);
        }
        else
        {
          return CustomBooksShimmerListView(
            height: h * 0.15,
            width: w * 0.2,
          );
        }
      },
    );
  }
}

