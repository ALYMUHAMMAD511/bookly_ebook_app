part of 'featured_books_cubit.dart';

@immutable
abstract class FeaturedBooksState
{
  const FeaturedBooksState();
}

final class FeaturedBooksInitialState extends FeaturedBooksState {}

final class FeaturedBooksLoadingState extends FeaturedBooksState {}

final class FeaturedBooksSuccessState extends FeaturedBooksState
{
  final List<BookModel> books;

  const FeaturedBooksSuccessState(this.books);
}

final class FeaturedBooksFailureState extends FeaturedBooksState
{
  final String error;

  const FeaturedBooksFailureState(this.error);
}
