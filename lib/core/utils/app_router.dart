import 'package:bookly_ebook_app/constants.dart';
import 'package:bookly_ebook_app/core/utils/service_locator.dart';
import 'package:bookly_ebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_ebook_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly_ebook_app/features/home/presentation/manager/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_ebook_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_ebook_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_ebook_app/features/search/data/repos/search_repo_implementation.dart';
import 'package:bookly_ebook_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly_ebook_app/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kHomeView,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          transitionDuration: kTransitionDuration,
          key: state.pageKey,
          child: const HomeView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation, 
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: kBookDetailsView,
      builder: (context, state) => BlocProvider(
        create: (context) =>
            SimilarBooksCubit(getIt.get<HomeRepoImplementation>()),
        child: BookDetailsView(
          bookModel: state.extra as BookModel,
        ),
      ),
    ),
    GoRoute(
      path: kSearchView,
      builder: (context, state) => BlocProvider(
        create: (context) => SearchCubit(getIt.get<SearchRepoImplementation>()),
        child: const SearchView(),
      ),
    ),
  ]);
}
