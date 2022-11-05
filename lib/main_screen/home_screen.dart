import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double iconSize = 62;
  double paddingContainer = 16;
  double borderRadius = 16;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(bottom: 8, top: 8),
                width: double.infinity,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(215, 24, 167, 176),
                      Color.fromARGB(115, 24, 167, 176),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: ClipOval(
                        child: Image.asset(
                          'images/user.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Pao Chou',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'HR Manager',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipPath(
                          clipper: ShapeBorderClipper(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(borderRadius)),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 14,
                              bottom: 14,
                              left: 6,
                              right: 6,
                            ),
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.all(
                              //   Radius.circular(borderRadius),
                              // ),
                              border: const Border(
                                bottom: BorderSide(
                                    color: Color.fromRGBO(144, 202, 249, 1),
                                    width: 6),
                                left: BorderSide(
                                  color: Color.fromRGBO(144, 202, 249, 1),
                                  width: 6,
                                ),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: borderRadius,
                                  offset: const Offset(0, 0),
                                  color: Colors.cyan,
                                  spreadRadius: -10,
                                )
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(paddingContainer),
                                    margin: const EdgeInsets.only(bottom: 6),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.cyan,
                                    ),
                                    child: Icon(
                                      Icons.people_alt_outlined,
                                      color: Colors.white,
                                      size: iconSize,
                                    ),
                                  ),
                                  const Text(
                                    'Employee',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ClipPath(
                          clipper: ShapeBorderClipper(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(borderRadius)),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 14,
                              bottom: 14,
                              left: 6,
                              right: 6,
                            ),
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.all(
                              //   Radius.circular(borderRadius),
                              // ),
                              border: const Border(
                                  bottom: BorderSide(
                                    color: Color.fromRGBO(255, 224, 130, 1),
                                    width: 6,
                                  ),
                                  left: BorderSide(
                                    color: Color.fromRGBO(255, 224, 130, 1),
                                    width: 6,
                                  )),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: borderRadius,
                                    offset: const Offset(0, 0),
                                    color:
                                        const Color.fromRGBO(144, 202, 249, 1),
                                    spreadRadius: -10)
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(paddingContainer),
                                    margin: const EdgeInsets.only(bottom: 6),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.amber[300],
                                    ),
                                    child: Icon(
                                      Icons.list_alt_outlined,
                                      color: Colors.white,
                                      size: iconSize,
                                    ),
                                  ),
                                  const Text(
                                    'Task',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipPath(
                          clipper: ShapeBorderClipper(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(borderRadius)),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 14,
                              bottom: 14,
                              left: 6,
                              right: 6,
                            ),
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.all(
                              //   Radius.circular(borderRadius),
                              // ),
                              border: const Border(
                                  bottom: BorderSide(
                                    color: Color.fromRGBO(255, 171, 145, 1),
                                    width: 6,
                                  ),
                                  left: BorderSide(
                                    color: Color.fromRGBO(255, 171, 145, 1),
                                    width: 6,
                                  )),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: borderRadius,
                                    offset: const Offset(0, 0),
                                    color:
                                        const Color.fromRGBO(144, 202, 249, 1),
                                    spreadRadius: -10)
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(paddingContainer),
                                    margin: const EdgeInsets.only(bottom: 6),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.deepOrange[200],
                                    ),
                                    child: Icon(
                                      Icons.groups_rounded,
                                      color: Colors.white,
                                      size: iconSize,
                                    ),
                                  ),
                                  const Text(
                                    'Group',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ClipPath(
                          clipper: ShapeBorderClipper(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(borderRadius)),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 14,
                              bottom: 14,
                              left: 6,
                              right: 6,
                            ),
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.all(
                              //   Radius.circular(borderRadius),
                              // ),
                              border: const Border(
                                bottom: BorderSide(
                                  color: Colors.green,
                                  width: 6,
                                ),
                                left: BorderSide(
                                  color: Colors.green,
                                  width: 6,
                                ),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: borderRadius,
                                    offset: const Offset(0, 0),
                                    color:
                                        const Color.fromRGBO(144, 202, 249, 1),
                                    spreadRadius: -10)
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(paddingContainer),
                                    margin: const EdgeInsets.only(bottom: 6),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.green,
                                    ),
                                    child: Icon(
                                      Icons.payments_outlined,
                                      color: Colors.white,
                                      size: iconSize,
                                    ),
                                  ),
                                  const Text(
                                    'Payroll',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipPath(
                          clipper: ShapeBorderClipper(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(borderRadius)),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 14,
                              bottom: 14,
                              left: 6,
                              right: 6,
                            ),
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.all(
                              //   Radius.circular(borderRadius),
                              // ),
                              border: const Border(
                                  bottom: BorderSide(
                                    color: Color.fromRGBO(129, 212, 250, 1),
                                    width: 6,
                                  ),
                                  left: BorderSide(
                                    color: Color.fromRGBO(129, 212, 250, 1),
                                    width: 6,
                                  )),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: borderRadius,
                                    offset: const Offset(0, 0),
                                    color:
                                        const Color.fromRGBO(144, 202, 249, 1),
                                    spreadRadius: -10)
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(paddingContainer),
                                    margin: const EdgeInsets.only(bottom: 6),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.lightBlue[200],
                                    ),
                                    child: Icon(
                                      Icons.calendar_month_outlined,
                                      color: Colors.white,
                                      size: iconSize,
                                    ),
                                  ),
                                  const Text(
                                    'Attendance',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ClipPath(
                          clipper: ShapeBorderClipper(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(borderRadius)),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 14,
                              bottom: 14,
                              left: 6,
                              right: 6,
                            ),
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.all(
                              //   Radius.circular(borderRadius),
                              // ),
                              border: const Border(
                                  bottom: BorderSide(
                                    color: Color.fromRGBO(244, 143, 177, 1),
                                    width: 6,
                                  ),
                                  left: BorderSide(
                                    color: Color.fromRGBO(244, 143, 177, 1),
                                    width: 6,
                                  )),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: borderRadius,
                                  offset: const Offset(0, 0),
                                  color: const Color.fromRGBO(144, 202, 249, 1),
                                  spreadRadius: -10,
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(paddingContainer),
                                    margin: const EdgeInsets.only(bottom: 6),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.pink[200],
                                    ),
                                    child: Icon(
                                      Icons.list_alt_outlined,
                                      color: Colors.white,
                                      size: iconSize,
                                    ),
                                  ),
                                  const Text(
                                    'Task',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
      ),
    );
  }
}
