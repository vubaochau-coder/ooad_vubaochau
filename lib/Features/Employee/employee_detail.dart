import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/commons/employee_info.dart';
import 'package:ooad_vubaochau/commons/opaque_image.dart';
import 'package:ooad_vubaochau/commons/employee_info.dart';
import 'package:ooad_vubaochau/commons/profile_info_big_card.dart';
import 'package:ooad_vubaochau/styleguide/colors.dart';

class EmployeeProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Stack(
                children: <Widget>[
                  OpaqueImage(
                    imageUrl: "images\employee.jpg",
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
                color: Colors.white,
                child: Table(
                  children: const [
                    TableRow(
                      children: [
                        ProfileInfoBigCard(
                          firstText: "25",
                          secondText: "Dự án đã làm qua",
                          icon: Icon(Icons.star, color: blueColor),
                        ),
                        ProfileInfoBigCard(
                          firstText: "57 Quang Trung",
                          secondText: "TP Hồ Chí Minh - Việt Nam",
                          icon: Image.asset(
                            "images/adress_icon.png",
                            color: blueColor,
                          ),
                        ),
                      ],
                    ),
                    TableRow(),
                    TableRow(),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
