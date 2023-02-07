import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Notification/General%20Noification/general_view.dart';
import 'package:ooad_vubaochau/Notification/Private%20Notification/request.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Notifications',
            ),
            centerTitle: false,
            backgroundColor: Colors.transparent,
            leading: const Icon(Icons.notifications_active),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.mark_chat_read_outlined),
              )
            ],
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(215, 24, 167, 176),
                    Color.fromARGB(155, 24, 167, 176),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            elevation: 0,
            bottom: const TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.black54,
              unselectedLabelColor: Colors.white54,
              labelStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
              ),
              tabs: [
                Tab(
                  text: "GENERAL",
                ),
                Tab(
                  text: 'REQUEST',
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              GeneralNotifyScreen(),
              RequestNotifyScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
