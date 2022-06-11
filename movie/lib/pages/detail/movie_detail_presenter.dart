import 'dart:async';

import 'package:commons/commons.dart';
import 'package:model/model.dart';

import '../../movie.dart';

class MovieDetailPresenter extends GetxController {
  MovieRepository repository;
  MovieDetailPresenter(this.repository);
  Rx<MovieDetail?> movie = Rx(null);
  final ratingBar = (0.0).obs;

  getData(int id) async {
    movie.value = null;
    ratingBar.value = 0;
    var result = await Get.find<MovieRepository>().getDetailMovie(id);
    result.fold((l) => null, (r) async {
      movie.value = r;
      Future.delayed(const Duration(milliseconds: 500)).then(
          (v) => Timer.periodic(const Duration(milliseconds: 50), (timer) {
                if ((timer.tick / 2) > (movie.value?.voteAvg ?? 0)) {
                  timer.cancel();
                }
                ratingBar.value = timer.tick / 2;
              }));
    });
  }
}
