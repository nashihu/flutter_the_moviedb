import 'package:flutter/material.dart';

import 'commons.dart';

Widget defaultNetworkImage(String imageUrl) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    placeholder: (c, s) {
      return const Padding(
        padding: EdgeInsets.only(top: 18.0),
        child: CircularProgressIndicator(),
      );
    },
  );
}
