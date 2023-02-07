import 'package:cloud_firestore/cloud_firestore.dart';

class TestSalaryLabel {
  final String text;
  final String color;

  TestSalaryLabel({required this.text, required this.color});

  factory TestSalaryLabel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data()!;
    return TestSalaryLabel(
      text: data["text"],
      color: data["color"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'color': color,
    };
  }
}
