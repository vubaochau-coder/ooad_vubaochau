import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Custom%20widget/my_operation_button.dart';
import 'package:ooad_vubaochau/Attendance/attendance_view.dart';
import 'package:ooad_vubaochau/Form%20Requirement/requirement_list_view.dart';
import 'package:ooad_vubaochau/QuanLyNhanVien/quan_ly_nhan_vien_view.dart';
import 'package:ooad_vubaochau/My%20Profile/my_profile_view.dart';
import 'package:ooad_vubaochau/main_screen/Home%20group/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double iconSize = 62;
  double paddingContainer = 16;
  double borderRadius = 16;

  String fullName = "Vũ Bảo Châu";
  String viewPosition = "BACK-END DEVELOPER";
  String avatar = '';
  String myEmail = 'admin@gmail.com';
  int myLevelPer = 3;
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
        elevation: 0,
      ),
      drawer: Navigationdrawer(
        name: fullName,
        imgURL: avatar,
        email: myEmail,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 125 + MediaQuery.of(context).padding.top + kToolbarHeight,
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
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: avatar.isEmpty
                                  ? const CircleAvatar(
                                      backgroundImage:
                                          AssetImage('images/employee.jpg'))
                                  : CircleAvatar(
                                      backgroundImage: NetworkImage(avatar),
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
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 12, bottom: 12),
                          child: Divider(
                            color: Colors.white,
                            height: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(
                                Icons.person_pin_circle_sharp,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                'ADMIN OF APPLICAtiON',
                                style: TextStyle(
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
                        'Quản lý',
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
                        borderRadius: BorderRadius.circular(16),
                        child: const OperationButton(
                          name: 'Nhân viên',
                          icon: Icons.people,
                        ),
                        onTap: () {
                          Future.delayed(const Duration(milliseconds: 150), () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const QuanLyNhanVien();
                                },
                              ),
                            );
                          });
                        },
                      ),
                      InkWell(
                        splashColor: themeColor,
                        borderRadius: BorderRadius.circular(16),
                        child: const OperationButton(
                          name: 'Lương',
                          icon: Icons.payments_outlined,
                        ),
                        onTap: () {
                          Future.delayed(const Duration(milliseconds: 150), () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const MyProfileDetail();
                                },
                              ),
                            );
                          });
                        },
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
                        borderRadius: BorderRadius.circular(16),
                        child: const OperationButton(
                          name: 'Đơn vị',
                          icon: Icons.groups_sharp,
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
                        borderRadius: BorderRadius.circular(16),
                        child: const OperationButton(
                            name: 'Đoàn thể', icon: Icons.meeting_room_sharp),
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
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: themeColor,
                        borderRadius: BorderRadius.circular(16),
                        child: const OperationButton(
                          name: 'Trình độ',
                          icon: Icons.school,
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
                        borderRadius: BorderRadius.circular(16),
                        child: const OperationButton(
                            name: 'Chức vụ',
                            icon: Icons.assignment_ind_outlined),
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
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: themeColor,
                        borderRadius: BorderRadius.circular(16),
                        child: const OperationButton(
                          name: 'Thân nhân',
                          icon: Icons.family_restroom,
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
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
