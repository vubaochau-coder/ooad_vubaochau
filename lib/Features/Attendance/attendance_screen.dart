import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ooad_vubaochau/commons/radial_progress.dart';
import 'package:slide_to_act/slide_to_act.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  final GlobalKey<SlideActionState> key = GlobalKey();
  bool checkedIn = false;

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
                              const Text(
                                "9:30 AM",
                                style: TextStyle(
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
                            children: const [
                              Text(
                                "Check Out",
                                style: TextStyle(
                                  fontFamily: "NexaRegular",
                                  fontSize: 20,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                " --/-- --",
                                style: TextStyle(
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
          Container(
            padding:
                const EdgeInsets.only(top: 4, left: 24, right: 24, bottom: 42),
            child: SlideAction(
              text: checkedIn ? "Swipe to Check out" : "Swipe to Check in",
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
              onSubmit: () {
                setState(() {
                  checkedIn = !checkedIn;
                });
                if (key.currentState != null) {
                  key.currentState!.reset();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
