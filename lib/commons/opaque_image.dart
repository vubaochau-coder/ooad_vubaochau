import 'package:flutter/material.dart';

class OpaqueImage extends StatelessWidget {
  final String imageUrl;
  const OpaqueImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return buildWithoutHero();
  }

  Widget buildWithoutHero() {
    return Stack(
      children: <Widget>[
        Image.asset(
          imageUrl,
          width: double.maxFinite,
          height: double.maxFinite,
          fit: BoxFit.contain,
        ),
        Container(
          color: const Color.fromARGB(215, 24, 167, 176),
        ),
      ],
    );
  }
}
