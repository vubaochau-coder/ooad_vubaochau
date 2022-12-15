import 'package:flutter/material.dart';

class OperationButton extends StatefulWidget {
  const OperationButton(this.name, this.icon, {super.key});
  final IconData icon;
  final String name;
  @override
  State<OperationButton> createState() => _OperationButtonState();
}

class _OperationButtonState extends State<OperationButton> {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90 * 1.618,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: themeColor,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Icon(
              widget.icon,
              color: themeColor,
              size: 40,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            widget.name,
            style: TextStyle(
              color: themeColor,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
