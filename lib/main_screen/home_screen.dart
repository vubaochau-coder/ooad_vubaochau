import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Custom%20widget/my_operation_button.dart';
import 'package:ooad_vubaochau/Features/Attendance/attendance_screen.dart';
import 'package:ooad_vubaochau/Features/RequirementForm/requirement_list.dart';
import 'package:ooad_vubaochau/Features/Task/task_list_4_employee.dart';
import 'package:ooad_vubaochau/main_screen/Home%20group/admin_feature.dart';
import 'package:ooad_vubaochau/main_screen/Home%20group/drawer.dart';
import 'package:ooad_vubaochau/main_screen/Home%20group/manager_feature.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double iconSize = 62;
  double paddingContainer = 16;
  double borderRadius = 16;

  String fullName = "VU BAO CHAU";
  String position = "BACK-END DEVELOPER";
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Home',
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          )
        ],
        elevation: 0,
      ),
      drawer: const NavigationDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 125 + MediaQuery.of(context).padding.top + kToolbarHeight,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              decoration: BoxDecoration(
                color: themeColor,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0.0, 0.75),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 125 +
                        MediaQuery.of(context).padding.top +
                        kToolbarHeight,
                    decoration: BoxDecoration(
                      color: themeColor,
                      image: const DecorationImage(
                        image: AssetImage('images/admin_background.jpg'),
                        fit: BoxFit.cover,
                        opacity: 0.3,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 125 +
                        MediaQuery.of(context).padding.top +
                        kToolbarHeight,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: kToolbarHeight,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                left: 10,
                              ),
                              height: 64,
                              width: 64,
                              child: const CircleAvatar(
                                backgroundImage:
                                    AssetImage('images/employee.jpg'),
                              ),
                            ),
                            Container(
                              height: 64,
                              margin: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Good morning!',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    fullName,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Divider(
                            color: Colors.white,
                            height: 1,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.person_pin_circle_sharp,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                position,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20,
                bottom: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.app_registration,
                        color: themeColor,
                      ),
                      Text(
                        'Staff',
                        style: TextStyle(
                          color: themeColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: themeColor,
                        borderRadius: BorderRadius.circular(12),
                        child: const OperationButton(
                          name: 'Task',
                          icon: Icons.content_paste,
                        ),
                        onTap: () {
                          Future.delayed(const Duration(milliseconds: 150), () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const EmployeeTaskList();
                                },
                              ),
                            );
                          });
                        },
                      ),
                      InkWell(
                        splashColor: themeColor,
                        borderRadius: BorderRadius.circular(12),
                        child: const OperationButton(
                          name: 'Profile',
                          icon: Icons.person_outline,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: themeColor,
                        borderRadius: BorderRadius.circular(12),
                        child: const OperationButton(
                          name: 'Requirement',
                          icon: Icons.contact_mail_outlined,
                        ),
                        onTap: () {
                          Future.delayed(const Duration(milliseconds: 150), () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const ManagerRequiredList();
                                },
                              ),
                            );
                          });
                        },
                      ),
                      InkWell(
                        splashColor: themeColor,
                        borderRadius: BorderRadius.circular(12),
                        child: const OperationButton(
                            name: 'Attendance',
                            icon: Icons.library_add_check_outlined),
                        onTap: () {
                          Future.delayed(const Duration(milliseconds: 150), () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const AttendanceScreen();
                                },
                              ),
                            );
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const ManagerFeatures(),
            const SizedBox(
              height: 20,
            ),
            const AdminFeatures(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
