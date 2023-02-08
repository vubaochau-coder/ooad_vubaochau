import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:ooad_vubaochau/Models/Requirement_Models/manager_requirement.dart';

DateFormat dateFormat = DateFormat('MMM d, yyyy');

class RequirementScreenModel {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> get formChanges {
    return FirebaseFirestore.instance.collection("Requirement").snapshots();
  }

  Future<List<ManagerRequiredModel>> getData() async {
    List<ManagerRequiredModel> fullRequirements = [];

    final userQuery = await firestore
        .collection('Users')
        .where('email', isEqualTo: auth.currentUser!.email)
        .get();
    String userID = userQuery.docs[0].id;
    String nameUser = userQuery.docs[0].data()['name'];

    final formQuery = await firestore
        .collection('Requirement')
        .where('idWriter', isEqualTo: userID)
        .get();

    for (var formDoc in formQuery.docs) {
      String idManager = formDoc.data()['idManager'];

      final managerQuery =
          await firestore.collection('Users').doc(idManager).get();
      String nameManager = managerQuery.data()!['name'];

      fullRequirements.add(
          ManagerRequiredModel.fromSnapshot(formDoc, nameUser, nameManager));
    }
    return fullRequirements;
  }

  Future<void> createRequirement(String title, String description) async {
    final accQuery = await firestore
        .collection('Account')
        .where('userName', isEqualTo: auth.currentUser!.email)
        .get();
    int levelPer = accQuery.docs[0].data()['levelPermission'];

    final userQuery = await firestore
        .collection('Users')
        .where('email', isEqualTo: auth.currentUser!.email)
        .get();
    String uid = userQuery.docs[0].id;

    String userDepart = userQuery.docs[0].data()['idDepartment'];

    if (userDepart.isEmpty || levelPer != 3) {
      final adminQuery = await firestore
          .collection('Account')
          .where('levelPermission', isEqualTo: 1)
          .get();
      String admID = adminQuery.docs[0].id;

      final ref = await firestore.collection('Requirement').add({
        'date': dateFormat.format(DateTime.now()),
        'description': description,
        'title': title,
        'status': 'Sended',
        'idManager': admID,
        'idWriter': uid,
      });

      await firestore.collection('Users').doc(admID).collection('Request').add({
        'requestID': ref.id,
      });
    } else {
      final departQuery =
          await firestore.collection('Department').doc(userDepart).get();
      String managerID = departQuery.data()!['manager'];

      final ref = await firestore.collection('Requirement').add({
        'date': dateFormat.format(DateTime.now()),
        'description': description,
        'title': title,
        'status': 'Sended',
        'idManager': managerID,
        'idWriter': uid,
      });

      await firestore
          .collection('Users')
          .doc(managerID)
          .collection('Request')
          .add({
        'requestID': ref.id,
      });
    }
  }
}
