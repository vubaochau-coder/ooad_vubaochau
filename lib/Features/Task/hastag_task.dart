import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Models/Task_Models/label.dart';

class TaskHastag extends StatelessWidget {
  final MyLabelModel label;
  const TaskHastag({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 3),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: label.color,
      ),
      constraints: const BoxConstraints(minWidth: 28),
      child: Text(
        label.text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
