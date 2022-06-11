import 'package:flutter/material.dart';
import 'package:commons/commons.dart';
import 'package:model/model.dart';
import 'package:television/ui/tv_detail_page.dart';

import '../repository/tv_repository.dart';

class TVListPage extends StatefulWidget {
  final bool isPopular;

  const TVListPage({
    Key? key,
    required this.isPopular,
  }) : super(key: key);
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<TVListPage> {
  static const _pageSize = 20;

  final PagingController<int, TV> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      var repository = Get.find<TVRepository>();
      dynamic result;
      if (widget.isPopular) {
        result = await repository.getPopular(pageKey);
      } else {
        result = await repository.getOnTheAir(pageKey);
      }

      result.fold((error) {
        _pagingController.error = error;
      }, (r) {
        List<TV> newItems = r;
        final isLastPage = newItems.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = pageKey + newItems.length;
          _pagingController.appendPage(newItems, nextPageKey);
        }
      });
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) => PagedListView<int, TV>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<TV>(
            itemBuilder: (context, item, index) => _buildMovieCard(item)),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Widget _buildMovieCard(TV movie) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (c) => TVDetailPage(id: movie.id!)));
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
