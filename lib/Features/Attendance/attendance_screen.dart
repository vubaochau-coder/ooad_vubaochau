import 'dart:html';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: themeColor,
        title: const Text(
          'Attendance',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75),
                  ),
                ],
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Today's Status",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.sort,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 32),
            height: 150,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(2, 2),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Check In",
                        style: TextStyle(
                          fontFamily: "NexaRegular",
                          fontSize: 20,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
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
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        " --/-- PM",
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
          Container(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                    text: DateTime.now().day.toString(),
                    style: const TextStyle(
                      color: Color.fromARGB(215, 24, 167, 176),
                      fontSize: 30,
                      fontFamily: "NexaBold",
                    ),
                    children: [
                      TextSpan(
                          text: DateFormat(' MMMM yyyy').format(DateTime.now()),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: "NexaBold",
                          ))
                    ]),
              )),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              "28 Dec 2022",
              style: TextStyle(
                fontFamily: "NexaBold",
                fontSize: 30,
                color: Colors.black54,
              ),
            ),
          ),
          StreamBuilder(
              stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context, snapshot) {
                return Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    DateFormat('hh:mm:ss a').format(DateTime.now()),
                    style: const TextStyle(
                      fontFamily: "NexaRegular",
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                  ),
                );
              }),
          Container(
            margin: const EdgeInsets.only(top: 24),
            child: Builder(builder: (context) {
              final GlobalKey<SlideActionState> key = GlobalKey();
              return SlideAction(
                text: "Slide to Check Out",
                textStyle: const TextStyle(
                  color: Colors.black54,
                  fontSize: 30,
                  fontFamily: "NexaRegular",
                ),
                outerColor: const Color.fromARGB(215, 24, 167, 176),
                innerColor: Colors.green.shade100,
                key: key,
                onSubmit: () {
                  key.currentState!.reset();
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
