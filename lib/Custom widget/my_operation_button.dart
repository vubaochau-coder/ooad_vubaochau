import 'package:flutter/material.dart';

class OperationButton extends StatelessWidget {
  final IconData icon;
  final String name;
  const OperationButton({required this.name, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    Color themeColor = const Color.fromARGB(215, 24, 167, 176);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      color: Colors.transparent,
      child: Container(
        width: 98 * 1.618,
        height: 98,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              icon,
              color: themeColor.withOpacity(0.05),
              size: 90,
            ),
            Positioned(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    child: Icon(
                      icon,
                      color: themeColor,
                      size: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      color: themeColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
