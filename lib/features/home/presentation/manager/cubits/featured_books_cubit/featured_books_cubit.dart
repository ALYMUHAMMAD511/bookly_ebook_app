import 'package:bookly_ebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_ebook_app/features/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState>
{
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitialState());

  final HomeRepo homeRepo;
  bool loading = false;

  Future<void> fetchFeaturedBooks() async
  {
    loading = true;
    emit(FeaturedBooksLoadingState());
    var result = await homeRepo.fetchFeaturedBooks();

    result.fold((failure){
      loading = false;
      emit(FeaturedBooksFailureState(failure.error));
    }, (books){
      loading = false;
      emit(FeaturedBooksSuccessState(books));
    });
  }
}
