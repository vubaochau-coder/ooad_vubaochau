import 'package:cloud_firestore/cloud_firestore.dart';

class MemberInTask {
  final String id;

  MemberInTask({required this.id});

  factory MemberInTask.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return MemberInTask(id: data["id"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
