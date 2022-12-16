import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/styleguide/text_style.dart';
import 'commons/employee_info.dart';
import 'commons/opaque_image.dart';
import 'commons/profile_info_big_card.dart';
import 'commons/profile_info_card.dart';
import 'styleguide/colors.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
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
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 60,
                              child: Card(
                                elevation: 2,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      '54%',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Progress',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              ),
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
                            child: SizedBox(
                              height: 60,
                              child: Card(
                                elevation: 2,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      'Senior',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Level',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              ),
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
                      SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Container(
                              height: 100,
                              width: double.infinity,
                              margin: const EdgeInsets.only(left: 10, right: 5),
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12, top: 18),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '25',
                                        style: titleStyle,
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        'Dự án đã làm',
                                        style: subTitleStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              right: 13,
                              top: 8,
                              child: Icon(
                                Icons.star_purple500_outlined,
                                color: blueColor,
                                size: 32,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Container(
                              height: 100,
                              width: double.infinity,
                              margin: const EdgeInsets.only(left: 10, right: 5),
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12, top: 18),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '02',
                                        style: titleStyle,
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        'Ngày nghỉ',
                                        style: subTitleStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              right: 13,
                              top: 8,
                              child: Icon(
                                Icons.free_cancellation_rounded,
                                color: blueColor,
                                size: 32,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 120,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Container(
                              height: 120,
                              width: double.infinity,
                              margin: const EdgeInsets.only(left: 10, right: 5),
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, top: 18, right: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Email',
                                        style: titleStyle,
                                        maxLines: 3,
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        '20521128@gm.uit.edu.vn',
                                        style: subTitleStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              right: 13,
                              top: 8,
                              child: Icon(
                                Icons.mail_rounded,
                                color: blueColor,
                                size: 32,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Container(
                              height: 100,
                              width: double.infinity,
                              margin: const EdgeInsets.only(left: 5, right: 10),
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12, top: 18),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '256',
                                        style: titleStyle,
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        'Ngày đi làm',
                                        style: subTitleStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              right: 18,
                              top: 8,
                              child: Icon(
                                Icons.free_cancellation_rounded,
                                color: blueColor,
                                size: 32,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 120,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Container(
                              height: 120,
                              width: double.infinity,
                              margin: const EdgeInsets.only(left: 5, right: 10),
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12, top: 18),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Địa chỉ',
                                        style: titleStyle,
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        '57 Quang Trung, TP. Hồ Chí Minh',
                                        style: subTitleStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              right: 18,
                              top: 8,
                              child: Icon(
                                Icons.location_on,
                                color: blueColor,
                                size: 32,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Container(
                              height: 100,
                              width: double.infinity,
                              margin: const EdgeInsets.only(left: 5, right: 10),
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, top: 18, right: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Phone',
                                        style: titleStyle,
                                        maxLines: 3,
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        '1900.xxxx.xxxx',
                                        style: subTitleStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              right: 18,
                              top: 8,
                              child: Icon(
                                Icons.phone,
                                color: blueColor,
                                size: 32,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Table(
            //   children: const [
            //     TableRow(
            //       children: [
            //         ProfileInfoBigCard(
            //           firstText: "25",
            //           secondText: "Dự án đã làm qua",
            //           icon: Icon(
            //             Icons.star,
            //             color: blueColor,
            //             size: 32,
            //           ),
            //         ),
            //         ProfileInfoBigCard(
            //           firstText: "57 Quang Trung",
            //           secondText: "TP Hồ Chí Minh - Việt Nam",
            //           icon: Icon(
            //             Icons.add_reaction,
            //             color: blueColor,
            //             size: 32,
            //           ),
            //         ),
            //       ],
            //     ),
            //     TableRow(
            //       children: [
            //         ProfileInfoBigCard(
            //           firstText: "2",
            //           secondText: "Ngày nghỉ",
            //           icon: Icon(
            //             Icons.heart_broken,
            //             color: blueColor,
            //             size: 32,
            //           ),
            //         ),
            //         ProfileInfoBigCard(
            //           firstText: "208",
            //           secondText: "Số ngày đã đi làm",
            //           icon: Icon(
            //             Icons.favorite,
            //             color: blueColor,
            //             size: 32,
            //           ),
            //         ),
            //       ],
            //     ),
            //     TableRow(
            //       children: [
            //         ProfileInfoBigCard(
            //           firstText: "20520159@gm.uit.edu.vn",
            //           secondText: "Email",
            //           icon: Icon(
            //             Icons.email,
            //             color: blueColor,
            //             size: 32,
            //           ),
            //         ),
            //         ProfileInfoBigCard(
            //           firstText: "0336114707",
            //           secondText: "Số điện thoại liên lạc",
            //           icon: Icon(
            //             Icons.headphones,
            //             color: blueColor,
            //             size: 32,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
