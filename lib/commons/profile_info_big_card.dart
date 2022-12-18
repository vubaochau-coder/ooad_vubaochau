import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/styleguide/text_style.dart';

import '../styleguide/colors.dart';

class ProfileInfoBigCard extends StatelessWidget {
  final String firstText, secondText;
  final IconData icon;
  final double height;

  const ProfileInfoBigCard(
      {super.key,
      required this.firstText,
      required this.secondText,
      required this.icon,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            height: height,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 5, right: 5),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  top: 18,
                  right: 12,
                  bottom: 18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      firstText,
                      style: titleStyle,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      secondText,
                      style: subTitleStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 13,
            top: 8,
            child: Icon(
              icon,
              color: blueColor,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
