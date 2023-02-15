import 'package:cloud_firestore/cloud_firestore.dart';

class ChucVu {
  final String name;
  final String id;
  final double phuCap;

  ChucVu({required this.id, required this.name, required this.phuCap});

  factory ChucVu.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return ChucVu(
      id: snapshot.id,
      name: data['name'],
      phuCap: double.parse(data['phuCap'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phuCap': phuCap,
    };
  }
}
