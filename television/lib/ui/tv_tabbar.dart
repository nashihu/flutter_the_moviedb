import 'package:flutter/material.dart';
import 'package:television/ui/tv_list_page.dart';

class TelevisionTabbar extends StatelessWidget {
  const TelevisionTabbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
                    child: Text('Popular'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('On Air'),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 9,
              child: TabBarView(
                children: [
                  TVListPage(isPopular: true),
                  TVListPage(isPopular: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
