import 'dart:async';

import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:movie/repository/movie_repository.dart';

import 'package:commons/commons.dart';

import 'movie_detail_presenter.dart';

class MoviePopularDetailPage extends StatefulWidget {
  final int id;
  const MoviePopularDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<MoviePopularDetailPage> createState() => _MoviePopularDetailPageState();
}

class _MoviePopularDetailPageState extends State<MoviePopularDetailPage> {
  final presenter = Get.find<MovieDetailPresenter>();

  @override
  void initState() {
    super.initState();
    presenter.getData(widget.id);
  }

  List<Widget> get loadingBuilder {
    return [
      const Padding(
        padding: EdgeInsets.only(top: 20),
        child: Center(child: CircularProgressIndicator()),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: presenter.movie.value == null
                ? loadingBuilder
                : [
                    CachedNetworkImage(
                      imageUrl: image(presenter.movie.value?.backdropPath),
                      placeholder: (c, s) {
                        return const CircularProgressIndicator();
                      },
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            presenter.movie.value?.originalTitle ?? '',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Text(presenter.movie.value?.overview ?? ''),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircularProgressIndicator(
                                      value: presenter.ratingBar.value / 10),
                                  Text('${presenter.movie.value?.voteAvg}')
                                ],
                              ),
                              const SizedBox(width: 20),
                              Text(presenter.movie.value?.releaseDate ?? ''),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text('Genres:'),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                                physics: const ScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    presenter.movie.value?.genres.length ?? 0,
                                itemBuilder: (c, i) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(presenter
                                              .movie.value?.genres[i].name ??
                                          ''),
                                    )),
                          ),
                        ],
                      ),
                    ),
                  ],
          ),
        ),
      ));
  }
}

String image(String? path) {
  return 'https://image.tmdb.org/t/p/original/$path';
}
