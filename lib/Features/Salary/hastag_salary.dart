import 'package:flutter/material.dart';
import '../../Models/Salary_Models/label.dart';

class SalaryHastag extends StatelessWidget {
  final SalaryLabelModel labelModel;
  const SalaryHastag({super.key, required this.labelModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 3),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: labelModel.color,
      ),
      constraints: const BoxConstraints(minWidth: 28),
      child: Text(
        labelModel.text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
