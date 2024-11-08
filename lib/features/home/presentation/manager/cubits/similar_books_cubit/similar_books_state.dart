part of 'similar_books_cubit.dart';

@immutable
abstract class SimilarBooksState
{
  const SimilarBooksState();
}

final class SimilarBooksInitialState extends SimilarBooksState {}

final class SimilarBooksLoadingState extends SimilarBooksState {}

final class SimilarBooksSuccessState extends SimilarBooksState
{
  final List <BookModel> bookModel;

  const SimilarBooksSuccessState(this.bookModel);
}

final class SimilarBooksFailureState extends SimilarBooksState
{
  final String error;

  const SimilarBooksFailureState(this.error);
}
