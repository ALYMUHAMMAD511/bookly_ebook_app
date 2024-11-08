import 'package:bookly_ebook_app/core/errors/failures.dart';
import 'package:bookly_ebook_app/core/utils/api_service.dart';
import 'package:bookly_ebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_ebook_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplementation(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=programming',
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

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science',
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

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async
  {
    try {
      var data = await apiService.get(
        endPoint:
        'volumes?Filtering=free-ebooks&Sorting=relevance&q=programming',
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