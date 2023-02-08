import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String imagePath;
  final Size size;

  const RoundedImage({
    super.key,
    required this.imagePath,
    this.size = const Size.fromWidth(120),
  });
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        imagePath,
        width: size.width,
        height: size.width,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Image.asset(
          'images/employee.jpg',
          width: size.width,
          height: size.width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
