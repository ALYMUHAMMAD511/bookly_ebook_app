import 'package:bookly_ebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_ebook_app/features/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState>
{
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitialState());

  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async
  {
    emit(NewestBooksLoadingState());
    var result = await homeRepo.fetchNewestBooks();

    result.fold((failure){
      emit(NewestBooksFailureState(failure.error));
    }, (books){
      emit(NewestBooksSuccessState(books));
    });
  }
}
