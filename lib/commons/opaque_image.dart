import 'dart:html';

import 'package:flutter/material.dart';

class OpaqueImage extends StatelessWidget {
  final imageUrl;
  const OpaqueImage({Key? key, @required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          imageUrl,
          width: double.maxFinite,
          height: double.maxFinite,
          fit: BoxFit.fill,
        ),
        Container(
          color: Color.fromARGB(215, 24, 167, 176),
        ),
      ],
    );
  }
}
