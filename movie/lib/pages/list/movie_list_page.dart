import 'package:flutter/material.dart';
import 'package:commons/commons.dart';

import 'package:model/model.dart';
import 'package:movie/pages/list/movie_list_presenter.dart';
import '../detail/movie_detail_page.dart';

class MovieListPage extends StatefulWidget {
  final String type;

  const MovieListPage({
    Key? key,
    required this.type,
  }) : super(key: key);
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final presenter = Get.find<MovieListPresenter>();

  @override
  void initState() {
    presenter.init(widget.type);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => PagedListView<int, Movie>(
        pagingController: presenter.pagingController,
        builderDelegate: PagedChildBuilderDelegate<Movie>(
          itemBuilder: (context, item, index) => _buildMovieCard(item),
        ),
      );

  Widget _buildMovieCard(Movie movie) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (c) => MoviePopularDetailPage(id: movie.id!)));
        },
        child: Card(
          elevation: 3,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(13)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(children: [
              Expanded(
                  child: CachedNetworkImage(
                imageUrl: image(movie.posterPath),
                width: 30,
                placeholder: (c, s) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 0.0),
                    child: SizedBox(
                      width: 10,
                      height: 30,
                      child: LinearProgressIndicator(),
                    ),
                  );
                },
              )),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(movie.title ?? '',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

String image(String? path) {
  return 'https://image.tmdb.org/t/p/w500/$path';
}
