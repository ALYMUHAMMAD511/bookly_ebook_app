part of 'search_cubit.dart';

@immutable
abstract class SearchState
{
  const SearchState();
}

final class SearchInitialState extends SearchState {}

final class SearchLoadingState extends SearchState {}

final class SearchSuccessState extends SearchState
{
  final List<BookModel> bookModel;

  const SearchSuccessState(this.bookModel);
}

final class SearchFailureState extends SearchState
{
  final String error;

  const SearchFailureState(this.error);
}