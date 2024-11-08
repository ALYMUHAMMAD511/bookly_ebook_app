import 'package:bookly_ebook_app/constants.dart';
import 'package:bookly_ebook_app/core/utils/app_router.dart';
import 'package:bookly_ebook_app/core/utils/service_locator.dart';
import 'package:bookly_ebook_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly_ebook_app/features/home/presentation/manager/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_ebook_app/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/home/presentation/manager/cubits/newest_books_cubit/newest_books_cubit.dart';

void main() {
  runApp(const BooklyApp());
  setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImplementation>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImplementation>(),
          )..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
