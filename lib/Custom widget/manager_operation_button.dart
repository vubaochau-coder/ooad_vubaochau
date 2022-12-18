import 'package:flutter/material.dart';

class ManagerOperations extends StatelessWidget {
  final String text;
  final IconData icon;
  const ManagerOperations({required this.text, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    Color themeColor = const Color.fromARGB(215, 24, 167, 176);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 12,
          bottom: 12,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: themeColor.withAlpha(150),
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: themeColor,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              text,
              style: TextStyle(
                color: themeColor,
                fontWeight: FontWeight.normal,
                fontSize: 17,
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: themeColor,
            ),
          ],
        ),
      ),
    );
  }
}
