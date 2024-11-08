import 'package:bookly_ebook_app/core/errors/failures.dart';
import 'package:bookly_ebook_app/core/utils/api_service.dart';
import 'package:bookly_ebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_ebook_app/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplementation implements SearchRepo
{

  final ApiService apiService;

  SearchRepoImplementation(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> searchBooks(String query) async
  {
    try {
      var data = await apiService.get(
        endPoint:
        'volumes?Filtering=free-ebooks&q=$query',
      );

      List<BookModel> books = [];
      for(var item in data['items'])
      {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return (left(
          ServerFailure.fromDioException(e),
        ));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}