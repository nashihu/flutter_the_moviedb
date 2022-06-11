import 'package:flutter/material.dart';
import 'package:commons/commons.dart';
import 'package:movie/movie.dart';
import 'package:network/network.dart';
import 'package:television/repository/tv_repository.dart';
import 'package:youtap_test_ahmad/pages/splash_screen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void inject() {
    Get.put(Dio());
    Get.put(ApiHelper(Get.find()));
    Get.put<MovieRepository>(MovieRepositoryImpl(Get.find()));
    Get.put<TVRepository>(TVRepositoryImpl(Get.find()));

    Get.put(MovieDetailPresenter(Get.find()));
    Get.put(MovieListPresenter(Get.find()));
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    inject();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Movie',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (c) => const SplashScreenPage(),
      },
      // home: const SplashScreenPage(),
    );
  }
}
