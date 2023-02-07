import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:ooad_vubaochau/Models/Attendace_Models/attendace_day.dart';

DateFormat dateFormat = DateFormat('MMM d, yyyy');
DateFormat timeFormat = DateFormat('HH:mm');

class AttendanceModel {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  final String toDay = dateFormat.format(DateTime.now());
  Future<AttendanceDay> getAttendanceData() async {
    var currentUser = auth.currentUser!;
    final account = await firestore
        .collection("Account")
        .where("userName", isEqualTo: currentUser.email)
        .get();
    String id = account.docs[0].id;
    final query = await firestore
        .collection("Users")
        .where("id", isEqualTo: id)
        .limit(1)
        .get();
    String docId = query.docs[0].id;

    await checkExistsRecord(docId, toDay).then((value) {
      if (value == false) {
        createEmptyRecord(docId, toDay);
      }
    });

    final getRecordQuery = await firestore
        .collection("Users")
        .doc(docId)
        .collection("Record")
        .where("day", isEqualTo: toDay)
        .limit(1)
        .get();

    final totalQuery = await firestore
        .collection("Users")
        .doc(docId)
        .collection("Record")
        .where("checkIn", isNotEqualTo: "")
        .get();
    int total = totalQuery.size;
    return AttendanceDay.fromSnapshot(getRecordQuery.docs[0], docId, total);
  }

  Future<void> createEmptyRecord(String docID, String toDay) async {
    await firestore.collection("Users").doc(docID).collection("Record").add({
      "checkIn": "",
      "checkOut": "",
      "day": toDay,
    });
  }

  Future<bool> checkExistsRecord(String docID, String today) async {
    final getRecord = await firestore
        .collection("Users")
        .doc(docID)
        .collection("Record")
        .where("day", isEqualTo: today)
        .get();
    if (getRecord.size == 0) {
      return false;
    } else {
      return true;
    }
  }

  Future<String> userID() async {
    final query = await firestore
        .collection("Account")
        .where("userName", isEqualTo: auth.currentUser!.email)
        .get();
    final getUIDquery = await firestore
        .collection("Users")
        .where("id", isEqualTo: query.docs[0].id)
        .get();
    return getUIDquery.docs[0].id;
  }

  Future<void> onCheckIn(String recordId, String uid) async {
    final docRef = firestore
        .collection("Users")
        .doc(uid)
        .collection("Record")
        .doc(recordId);
    await docRef.update({"checkIn": timeFormat.format(DateTime.now())});
  }

  Future<void> onCheckOut(String recordId, String uid) async {
    final docRef = firestore
        .collection("Users")
        .doc(uid)
        .collection("Record")
        .doc(recordId);
    await docRef.update({"checkOut": timeFormat.format(DateTime.now())});
  }
}
