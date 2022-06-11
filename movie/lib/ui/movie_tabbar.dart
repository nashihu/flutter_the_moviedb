import 'package:flutter/material.dart';
import 'package:movie/pages/list/movie_list_page.dart';

class MovieTabbar extends StatelessWidget {
  const MovieTabbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // appBar: AppBar(
        //   bottom: const TabBar(
        //     tabs: [Text('Now Playing'), Text('Upcoming'), Text('Popular')],
        //   ),
        // ),
        body: Column(
          children: const [
            Expanded(
              child: TabBar(
                labelColor: Colors.blue,
                padding: EdgeInsets.all(10),
                tabs: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Now Playing'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Upcoming'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Popular'),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 9,
              child: TabBarView(
                children: [
                  MovieListPage(type: 'nowPlaying'),
                  MovieListPage(type: 'upcoming'),
                  MovieListPage(type: 'popular'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
