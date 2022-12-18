import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/commons/employee_info.dart';
import 'package:ooad_vubaochau/commons/opaque_image.dart';
import 'package:ooad_vubaochau/commons/profile_info_big_card.dart';
import 'package:ooad_vubaochau/commons/profile_info_card.dart';

class EmployeeProfile extends StatelessWidget {
  const EmployeeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "My Profile",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 334 + MediaQuery.of(context).padding.top,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  SizedBox(
                    height: 300 + MediaQuery.of(context).padding.top,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        const OpaqueImage(
                          imageUrl: "images/employee.jpg",
                        ),
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: 16,
                            ),
                            child: Column(
                              children: const [
                                MyInfo(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 0,
                    child: SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Expanded(
                            flex: 2,
                            child: IntroduceCard(
                              firstText: '54%',
                              secondText: 'Progress',
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Card(
                              child: Image.asset(
                                "images/pulse_icon.png",
                                color: const Color.fromARGB(255, 26, 218, 224),
                                width: 25,
                                height: 40,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Expanded(
                            flex: 2,
                            child: IntroduceCard(
                              firstText: 'Senior',
                              secondText: 'Level',
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
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: const [
                      ProfileInfoBigCard(
                        firstText: '25',
                        secondText: 'Dự án đã làm',
                        icon: Icons.star_purple500_outlined,
                        height: 100,
                      ),
                      ProfileInfoBigCard(
                        firstText: '02',
                        secondText: 'Ngày nghỉ',
                        icon: Icons.free_cancellation_rounded,
                        height: 100,
                      ),
                      ProfileInfoBigCard(
                        firstText: 'Email',
                        secondText: '20521128@gm.uit.edu.vn',
                        icon: Icons.email,
                        height: 120,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: const [
                      ProfileInfoBigCard(
                        firstText: '256',
                        secondText: 'Ngày đi làm',
                        icon: Icons.free_cancellation_rounded,
                        height: 100,
                      ),
                      ProfileInfoBigCard(
                        firstText: 'Địa chỉ',
                        secondText: '57 Quang Trung, TP Hồ Chí Minh',
                        icon: Icons.location_on,
                        height: 120,
                      ),
                      ProfileInfoBigCard(
                        firstText: 'Phone',
                        secondText: '1900.xxx.xxx',
                        icon: Icons.phone,
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
