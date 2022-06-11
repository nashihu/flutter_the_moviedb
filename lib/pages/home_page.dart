import 'package:flutter/material.dart';
import 'package:movie/ui/movie_tabbar.dart';
import 'package:profile/profile.dart';
import 'package:television/ui/tv_tabbar.dart';
import 'package:commons/commons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _selectedIndex = 0.obs;
  static const List<Widget> _widgetOptions = <Widget>[
    MovieTabbar(),
    TelevisionTabbar(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    _selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(
        title: const Text('The Movie DB'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex.value),
      ),
      bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Movie',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'TV',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex.value,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
    ));
  }
}
