import 'package:cloud_firestore/cloud_firestore.dart';

class MemberInTask {
  final String id;
  final String name;
  final String imgURL;

  MemberInTask({required this.id, required this.name, required this.imgURL});

  factory MemberInTask.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot, String img) {
    final data = snapshot.data()!;
    return MemberInTask(
      id: snapshot.id,
      name: data['name'],
      imgURL: img,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
