import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/commons/employee_info.dart';
import 'package:ooad_vubaochau/commons/opaque_image.dart';
import 'package:ooad_vubaochau/commons/profile_info_big_card.dart';
import 'package:ooad_vubaochau/commons/profile_info_card.dart';
import 'package:ooad_vubaochau/styleguide/colors.dart';

class EmployeeProfile extends StatelessWidget {
  const EmployeeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Stack(
                  children: <Widget>[
                    const OpaqueImage(
                      imageUrl: "images/employee.jpg",
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: const [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Employee's profile",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            MyInfo(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.only(top: 50),
                  color: Colors.white,
                  child: Table(
                    children: const [
                      TableRow(
                        children: [
                          ProfileInfoBigCard(
                            firstText: "25",
                            secondText: "Dự án đã làm qua",
                            icon: Icon(
                              Icons.star,
                              color: blueColor,
                              size: 32,
                            ),
                          ),
                          ProfileInfoBigCard(
                            firstText: "57 Quang Trung",
                            secondText: "TP Hồ Chí Minh - Việt Nam",
                            icon: Icon(
                              Icons.add_reaction,
                              color: blueColor,
                              size: 32,
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          ProfileInfoBigCard(
                            firstText: "2",
                            secondText: "Ngày nghỉ",
                            icon: Icon(
                              Icons.heart_broken,
                              color: blueColor,
                              size: 32,
                            ),
                          ),
                          ProfileInfoBigCard(
                            firstText: "208",
                            secondText: "Số ngày đã đi làm",
                            icon: Icon(
                              Icons.favorite,
                              color: blueColor,
                              size: 32,
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          ProfileInfoBigCard(
                            firstText: "20520159@gm.uit.edu.vn",
                            secondText: "Email",
                            icon: Icon(
                              Icons.email,
                              color: blueColor,
                              size: 32,
                            ),
                          ),
                          ProfileInfoBigCard(
                            firstText: "0336114707",
                            secondText: "Số điện thoại liên lạc",
                            icon: Icon(
                              Icons.headphones,
                              color: blueColor,
                              size: 32,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: screenHeight * (4 / 9),
            left: 16,
            right: 16,
            child: SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      child: Column(
                        children: const [
                          Text(
                            '54%',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Progress',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ProfileInfoCard(
                      hasImage: true,
                      imagePath: "images/pulse_icon.png",
                      firstText: null,
                      secondText: null,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ProfileInfoCard(
                      firstText: "Leader team Back-end App",
                      secondText: "Level",
                      imagePath: null,
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
