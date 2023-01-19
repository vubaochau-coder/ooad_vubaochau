import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Home%20Screen/home_screen_view.dart';
import 'package:ooad_vubaochau/main_screen/notification_screen.dart';
import 'package:ooad_vubaochau/main_screen/statistical_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final screens = const [
    HomeScreen(),
    NotificationScreen(),
    StatisticalScreen(),
  ];
  int bottomNavIndex = 0;
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedItemColor: themeColor,
        unselectedItemColor: Colors.black38,
        currentIndex: bottomNavIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_add),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistical',
          ),
        ],
        onTap: (value) {
          setState(() {
            bottomNavIndex = value;
          });
        },
      ),
    );
  }
}
