import 'package:bookly_ebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_ebook_app/features/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitialState());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoadingState());
    var result = await homeRepo.fetchSimilarBooks(category: category);

    result.fold(
      (failure) {
        emit(SimilarBooksFailureState(failure.error));
      },
      (books) {
        emit(SimilarBooksSuccessState(books));
      },
    );
  }
}
