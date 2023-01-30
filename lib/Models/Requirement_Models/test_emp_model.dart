import 'package:cloud_firestore/cloud_firestore.dart';

class MemberInWriting {
  final String id;

  MemberInWriting({required this.id});

  factory MemberInWriting.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return MemberInWriting(id: data["id"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
