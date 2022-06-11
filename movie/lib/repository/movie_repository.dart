import 'package:model/model.dart';
import 'package:network/network.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getPopularMovies(int page);
  Future<Either<Failure, List<Movie>>> getNowPlaying(int page);
  Future<Either<Failure, List<Movie>>> getUpcomingMovie(int page);
  Future<Either<Failure, MovieDetail>> getDetailMovie(int id);
}

class MovieRepositoryImpl extends MovieRepository {
  ApiHelper apiHelper;
  MovieRepositoryImpl(this.apiHelper);
  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies(int page) {
    return apiHelper.get(
      path: Urls.moviePopular(page),
      success: (result) {
        return Right(
            (result['results'] as List).map((e) => Movie.fromJson(e)).toList());
      },
      failure: (error) => Left(error),
    );
  }

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying(int page) {
    return apiHelper.get(
      path: Urls.movieNowPlaying(page),
      success: (result) {
        return Right(
            (result['results'] as List).map((e) => Movie.fromJson(e)).toList());
      },
      failure: (error) => Left(error),
    );
  }

  @override
  Future<Either<Failure, List<Movie>>> getUpcomingMovie(int page) {
    return apiHelper.get(
      path: Urls.moviePopular(page),
      success: (result) {
        return Right(
            (result['results'] as List).map((e) => Movie.fromJson(e)).toList());
      },
      failure: (error) => Left(error),
    );
  }

  @override
  Future<Either<Failure, MovieDetail>> getDetailMovie(int id) {
    return apiHelper.get(
      path: Urls.movieDetail(id),
      success: (result) {
        return Right((MovieDetail.fromJson(result)));
      },
      failure: (error) => Left(error),
    );
  }
}
