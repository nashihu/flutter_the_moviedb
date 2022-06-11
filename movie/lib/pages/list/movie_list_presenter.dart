import 'package:commons/commons.dart';
import 'package:model/model.dart';
import 'package:movie/repository/movie_repository.dart';

class MovieListPresenter extends GetxController {
  static const _pageSize = 20;
  MovieRepository repository;
  MovieListPresenter(this.repository);

  PagingController<int, Movie> pagingController =
      PagingController(firstPageKey: 1);

  void init(String type) {
    pagingController = PagingController(firstPageKey: 1);
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey, type);
    });
  }

  void close() {
    pagingController.dispose();
  }

  Future<void> _fetchPage(int pageKey, String type) async {
    try {
      var repository = Get.find<MovieRepository>();
      dynamic result;
      switch (type) {
        case 'popular':
          result = await repository.getPopularMovies(pageKey);
          break;
        case 'upcoming':
          result = await repository.getUpcomingMovie(pageKey);
          break;
        default:
          result = await repository.getNowPlaying(pageKey);
      }

      result.fold((error) {
        pagingController.error = error;
      }, (r) {
        List<Movie> newItems = r;
        final isLastPage = newItems.length < _pageSize;
        if (isLastPage) {
          pagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = pageKey + newItems.length;
          pagingController.appendPage(newItems, nextPageKey);
        }
      });
    } catch (error) {
      pagingController.error = error;
    }
  }
}
