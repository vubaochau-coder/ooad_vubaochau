import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/commons/radial_progress.dart';
import 'package:ooad_vubaochau/commons/rounded_image.dart';
import 'package:ooad_vubaochau/styleguide/text_style.dart';

class MyInfo extends StatelessWidget {
  final String name;
  final String posistion;
  final int yearOld;
  const MyInfo(
      {super.key,
      required this.name,
      required this.posistion,
      required this.yearOld});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ignore: prefer_const_constructors
        RadialProgress(
          width: 4,
          goalCompleted: 0.9,
          key: null,
          child: const RoundedImage(
            imagePath: "images/employee.jpg",
            size: Size.fromWidth(120.0),
          ),
        ),

        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              name,
              style: whiteNameTextStyle,
            ),
            Text(
              ", $yearOld",
              style: whiteNameTextStyle,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              posistion,
              style: whiteSubHeadingTextStyle,
            )
          ],
        ),
      ],
    );
  }
}
