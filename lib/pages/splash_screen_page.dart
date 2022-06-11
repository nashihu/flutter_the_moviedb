import 'dart:async';

import 'package:flutter/material.dart';
import 'package:commons/commons.dart';
import 'package:youtap_test_ahmad/pages/home_page.dart';
import 'package:youtap_test_ahmad/utils.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((_) {
      Get.to(() => const HomePage());
    });
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
        final prev = randomize.value;
        randomize.value = !prev;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  var randomize = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() => AnimatedContainer(
            width: randomize.value ? 200.0 : 100.0,
            height: randomize.value ? 100.0 : 200.0,
            color: randomize.value ? Colors.red : Colors.blue,
            alignment:
                randomize.value ? Alignment.center : AlignmentDirectional.topCenter,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastOutSlowIn,
            child: const Icon(Icons.movie_filter_outlined, size: 50),
          )),
          const SizedBox(height: 10),
          Text(
            'TMDB App',
            style: poppins.copyWith(
              fontSize: 30,
            ),
          ),
        ],
      ),
    ));
  }
}
