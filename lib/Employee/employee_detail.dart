import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Models/Employee_Models/employee_item_model.dart';
import 'package:ooad_vubaochau/commons/employee_info.dart';
import 'package:ooad_vubaochau/commons/opaque_image.dart';
import 'package:ooad_vubaochau/commons/profile_info_big_card.dart';
import 'package:ooad_vubaochau/commons/profile_info_card.dart';

class EmployeeDetailProfile extends StatefulWidget {
  final EmployeeItemModel employee;
  const EmployeeDetailProfile({super.key, required this.employee});

  @override
  State<EmployeeDetailProfile> createState() => _EmployeeDetailProfileState();
}

class _EmployeeDetailProfileState extends State<EmployeeDetailProfile> {
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
            "Employee's Profile",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
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
                        OpaqueImage(
                          imageUrl: widget.employee.imgURL,
                        ),
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: 16,
                            ),
                            child: MyInfo(
                              name: widget.employee.name,
                              posistion: widget.employee.position,
                              imageURL: widget.employee.imgURL,
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
                          Expanded(
                            flex: 2,
                            child: IntroduceCard(
                              firstText:
                                  "${(widget.employee.taskCountSuccess / widget.employee.taskCountTotal * 100).toStringAsFixed(0)}%",
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
                          Expanded(
                            flex: 2,
                            child: IntroduceCard(
                              firstText: widget.employee.levelPer == 1
                                  ? 'Admin'
                                  : widget.employee.levelPer == 2
                                      ? 'Manager'
                                      : 'Staff',
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
                    children: [
                      ProfileInfoBigCard(
                        firstText:
                            widget.employee.taskCountTotal.toStringAsFixed(0),
                        secondText: 'Dự án đã làm',
                        icon: Icons.star_purple500_outlined,
                        height: 100,
                      ),
                      ProfileInfoBigCard(
                        firstText: widget.employee.taskScore.toStringAsFixed(1),
                        secondText: 'Tổng điểm dự án',
                        icon: Icons.bar_chart,
                        height: 100,
                      ),
                      const ProfileInfoBigCard(
                        firstText: '02',
                        secondText: 'Ngày nghỉ',
                        icon: Icons.free_cancellation_rounded,
                        height: 100,
                      ),
                      ProfileInfoBigCard(
                        firstText: 'Email',
                        secondText: widget.employee.email,
                        icon: Icons.email,
                        height: 120,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const ProfileInfoBigCard(
                        firstText: '25',
                        secondText: 'Ngày đi làm',
                        icon: Icons.free_cancellation_rounded,
                        height: 100,
                      ),
                      ProfileInfoBigCard(
                        firstText: (widget.employee.taskScore /
                                widget.employee.taskCountTotal)
                            .toStringAsFixed(1),
                        secondText: 'Đánh giá dự án',
                        icon: Icons.polyline_outlined,
                        height: 100,
                      ),
                      ProfileInfoBigCard(
                        firstText: 'Phone',
                        secondText: widget.employee.phone,
                        icon: Icons.phone,
                        height: 100,
                      ),
                      ProfileInfoBigCard(
                        firstText: 'Địa chỉ',
                        secondText: widget.employee.address,
                        icon: Icons.location_on,
                        height: 120,
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
