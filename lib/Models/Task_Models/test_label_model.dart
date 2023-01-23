import 'package:cloud_firestore/cloud_firestore.dart';

class TestLabel {
  final String text;
  final String color;

  TestLabel({required this.text, required this.color});

  factory TestLabel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data()!;
    return TestLabel(
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
