import 'package:bookly_ebook_app/core/widgets/custom_error.dart';
import 'package:bookly_ebook_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_ebook_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../home/presentation/views/widgets/books_list_view_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccessState)
        {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) =>
                GestureDetector(
                  child: BooksListViewItem(
                    bookModel: state.bookModel[index],
                  ),
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouter.kBookDetailsView,
                      extra: state.bookModel,
                    );
                  },
                ),
            separatorBuilder: (context, index) =>
            const SizedBox(
              height: 20,
            ),
            itemCount: state.bookModel.length,
          );
        }
        else if (state is SearchFailureState)
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
