import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Models/Task_Models/test_emp_model.dart';

class AvatarNameUser extends StatelessWidget {
  final MemberInTask userInfo;
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
          child: ClipOval(
            child: Image.network(
              userInfo.imgURL,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'images/employee.jpg',
                  fit: BoxFit.contain,
                );
              },
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          userInfo.name,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
