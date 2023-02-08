import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ooad_vubaochau/Models/Requirement_Models/manager_requirement.dart';

class RequestNotifyModel {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Future<List<ManagerRequiredModel>> getListRequest() async {
    List<ManagerRequiredModel> data = [];
    final currentUser = auth.currentUser;
    final userQuery = await firestore
        .collection('Users')
        .where('email', isEqualTo: currentUser!.email)
        .get();
    String uid = userQuery.docs[0].id;
    String uName = userQuery.docs[0].data()['name'];

    final requestQuery = await firestore
        .collection('Users')
        .doc(uid)
        .collection('Request')
        .get();
    for (var ele in requestQuery.docs) {
      String requestID = ele.data()['requestID'];

      final requestDetailQuery =
          await firestore.collection('Requirement').doc(requestID).get();
      String idWriter = requestDetailQuery.data()!['idWriter'];

      final writerQuery =
          await firestore.collection('Users').doc(idWriter).get();
      String nameWriter = writerQuery.data()!['name'];

      data.add(ManagerRequiredModel.fromSnapshot(
          requestDetailQuery, nameWriter, uName));
    }
    return data;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get listenDataChange {
    return firestore.collection('Requirement').snapshots();
  }
}
