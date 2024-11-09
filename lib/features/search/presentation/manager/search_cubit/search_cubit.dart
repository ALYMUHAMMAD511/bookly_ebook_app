import 'package:bookly_ebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_ebook_app/features/search/data/repos/search_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitialState());

  final SearchRepo searchRepo;

  Future<void> searchBooks(String query) async {

    var result = await searchRepo.searchBooks(query);

    result.fold((failure) {
      emit(
        SearchFailureState(failure.error),
      );
    }, (books) {
      emit(
        SearchSuccessState(books),
      );
    });
  }
}
