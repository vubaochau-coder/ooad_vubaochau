import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import '../../Models/Information/User.dart';

class AttendanceModel {
  Future<void> getRecord(String checkIn, String checkOut) async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection("Account")
          .where('userName', isEqualTo: User.username)
          .get();

      DocumentSnapshot snap2 = await FirebaseFirestore.instance
          .collection("Account")
          .doc(snap.docs[0].id)
          .collection("Record")
          .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
          .get();
      setState(() {
        checkIn = snap2['checkIn'];
        checkOut = snap2['checkOut'];
      });
    } catch (e) {
      setState(() {
        checkIn = "--/--";
        checkOut = "--/--";
      });
    }
  }

  Future<void> getAttendance(String checkIn, String checkOut) async {
    QuerySnapshot snap = await FirebaseFirestore.instance
        .collection("Account")
        .where('userName', isEqualTo: User.username)
        .get();

    DocumentSnapshot snap2 = await FirebaseFirestore.instance
        .collection("Account")
        .doc(snap.docs[0].id)
        .collection("Record")
        .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
        .get();

    try {
      String checkIn = snap2['checkIn'];

      setState(() {
        checkOut = DateFormat('hh:mm').format(DateTime.now());
      });

      await FirebaseFirestore.instance
          .collection("Account")
          .doc(snap.docs[0].id)
          .collection("Record")
          .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
          .update({
        'checkIn': checkIn,
        'checkOut': DateFormat('hh:mm').format(DateTime.now()),
      });
    } catch (e) {
      setState(() {
        checkIn = DateFormat('hh:mm').format(DateTime.now());
      });
      await FirebaseFirestore.instance
          .collection("Account")
          .doc(snap.docs[0].id)
          .collection("Record")
          .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
          .set({
        'checkIn': DateFormat('hh:mm').format(DateTime.now()),
      });
    }
  }
}

void setState(Null Function() param0) {}
