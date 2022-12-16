// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/commons/two_line_item.dart';
import 'package:ooad_vubaochau/styleguide/colors.dart';

class ProfileInfoCard extends StatelessWidget {
  final firstText, secondText, hasImage, imagePath;

  const ProfileInfoCard(
      {super.key,
      required this.firstText,
      required this.secondText,
      this.hasImage = false,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 12,
        child: hasImage
            ? Image.asset(
                imagePath,
                color: primaryColor,
                width: 25,
                height: 25,
              )
            : TwoLineItem(
                firstText: firstText,
                secondText: secondText,
              ),
      ),
    );
  }
}
