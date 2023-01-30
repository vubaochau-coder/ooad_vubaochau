import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Models/avt_name_model.dart';
import 'package:ooad_vubaochau/commons/rounded_image.dart';

class AvatarNameUser extends StatelessWidget {
  final AvatarNameModel userInfo;
  const AvatarNameUser({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    Color themeColor = const Color.fromARGB(215, 24, 167, 176);
    return Row(
      children: [
        Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: themeColor,
              width: 1,
            ),
          ),
          child: const RoundedImage(
            imagePath: "images/employee.jpg",
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        const Text(
          "Vu Bao Chau",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
