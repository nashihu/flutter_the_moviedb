import 'dart:async';

import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:television/repository/tv_repository.dart';

import 'package:commons/commons.dart';

class TVDetailPage extends StatefulWidget {
  final int id;
  const TVDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<TVDetailPage> createState() => _TVDetailPageState();
}

class _TVDetailPageState extends State<TVDetailPage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Rx<TVDetail?> movie = Rx(null);

  getData() async {
    var result = await Get.find<TVRepository>().getDetailTV(widget.id);
    result.fold((l) => null, (r) {
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

  final ratingBar = (0.0).obs;

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
              children: movie.value == null
                  ? loadingBuilder
                  : [
                      defaultNetworkImage(image(movie.value?.backdropPath)),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              movie.value?.originalTitle ?? '',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            Text(movie.value?.overview ?? ''),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CircularProgressIndicator(
                                        value: ratingBar.value / 10),
                                    Text('${movie.value?.voteAvg}')
                                  ],
                                ),
                                const SizedBox(width: 20),
                                Text(movie.value?.releaseDate ?? ''),
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
                                  itemCount: movie.value?.genres.length ?? 0,
                                  itemBuilder: (c, i) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            movie.value?.genres[i].name ?? ''),
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
