import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ooad_vubaochau/Attendance/abstract_attendance_view.dart';
import 'package:ooad_vubaochau/Attendance/attendance_presenter.dart';
import 'package:ooad_vubaochau/commons/radial_progress.dart';
import 'package:slide_to_act/slide_to_act.dart';
import '../../Models/Information/User.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen>
    implements AttendanceView {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  final GlobalKey<SlideActionState> key = GlobalKey();
  String checkIn = "--/--";
  String checkOut = "--/--";
  late AttendancePresenter presenter;
  @override
  void initState() {
    super.initState();
    presenter = AttendancePresenter(this);
    _getRecord();
  }

  void _getRecord() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 330,
            child: Stack(
              children: [
                Container(
                  height: 258,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: themeColor,
                    image: const DecorationImage(
                      image: AssetImage(
                        'images/admin_background.jpg',
                      ),
                      fit: BoxFit.cover,
                      opacity: 0.3,
                    ),
                  ),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white70,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            left: 14,
                            bottom: 8,
                          ),
                          child: Text(
                            DateFormat('MMM dd, yyyy').format(DateTime.now()),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "NexaBold",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        StreamBuilder(
                          stream: Stream.periodic(const Duration(seconds: 3)),
                          builder: (context, snapshot) {
                            return Container(
                              alignment: Alignment.centerLeft,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    DateFormat('hh:mm').format(DateTime.now()),
                                    style: const TextStyle(
                                      //fontFamily: "NexaBold",
                                      fontSize: 48,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    DateFormat('a').format(DateTime.now()),
                                    style: const TextStyle(
                                      //fontFamily: "NexaBold",
                                      fontSize: 34,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 120,
                    width: 100,
                    margin: const EdgeInsets.only(left: 24, right: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(2, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Check In",
                                style: TextStyle(
                                  fontFamily: "NexaRegular",
                                  fontSize: 20,
                                  color: themeColor,
                                ),
                              ),
                              Text(
                                checkIn,
                                style: const TextStyle(
                                  fontFamily: "NexaBold",
                                  fontSize: 30,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const VerticalDivider(
                          color: Colors.black54,
                          width: 3,
                          indent: 28,
                          endIndent: 28,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Check Out",
                                style: TextStyle(
                                  fontFamily: "NexaRegular",
                                  fontSize: 20,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                checkOut,
                                style: const TextStyle(
                                  fontFamily: "NexaBold",
                                  fontSize: 30,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 14),
            child: Text(
              'Attendance process',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 6),
            padding: const EdgeInsets.only(top: 16, bottom: 8),
            //color: Colors.pink,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      RadialProgress(
                        width: 14,
                        goalCompleted: 21 / 30,
                        progressColor: themeColor,
                        progressBackgroundColor:
                            const Color.fromRGBO(224, 224, 224, 1),
                        child: Container(
                          alignment: Alignment.center,
                          height: 80,
                          width: 80,
                          child: const Text(
                            '21/30',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Working days',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      RadialProgress(
                        width: 14,
                        goalCompleted: 1 / 30,
                        progressColor: Colors.red,
                        progressBackgroundColor:
                            const Color.fromRGBO(224, 224, 224, 1),
                        child: Container(
                          alignment: Alignment.center,
                          height: 80,
                          width: 80,
                          child: const Text(
                            '01/30',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Days off',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          checkOut == "--/--"
              ? Container(
                  padding: const EdgeInsets.only(
                      top: 4, left: 24, right: 24, bottom: 42),
                  child: SlideAction(
                    text: checkIn == "--/--"
                        ? "Swipe to Check In"
                        : "Swipe to Check Out",
                    textStyle: const TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                      fontFamily: "NexaRegular",
                    ),
                    outerColor: const Color.fromARGB(215, 24, 167, 176),
                    innerColor: Colors.green.shade100,
                    animationDuration: const Duration(milliseconds: 500),
                    submittedIcon: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    key: key,
                    onSubmit: () async {
                      presenter.onAttendance(checkIn, checkOut);
                    },
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(
                      top: 4, left: 24, right: 24, bottom: 42),
                  child: Text(
                    "You have completed this day!",
                    style: TextStyle(
                      fontFamily: "NexaRegular",
                      fontSize: 20,
                      color: themeColor,
                    ),
                  ),
                )
        ],
      ),
    );
  }

  @override
  void onAttendance() {
    // TODO: implement onAttendance
  }
}
