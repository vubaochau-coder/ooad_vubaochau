import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Department/Emps%20Department/employee_deparment_view.dart';
import 'package:ooad_vubaochau/Department/Department%20Managerment/department_list_view.dart';

class ManageDepartmentScreen extends StatelessWidget {
  const ManageDepartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color themeColor = const Color.fromARGB(255, 18, 189, 184);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const TabBarView(
                  children: [
                    DepartmentListScreen(),
                    DepartmentEmpListScreen(),
                  ],
                ),
              ),
              SizedBox(
                height: 234,
                child: Stack(
                  children: [
                    Container(
                      height: 210,
                    ),
                    SizedBox(
                      height: 210,
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 6,
                      left: 34,
                      right: 34,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: themeColor.withAlpha(50),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: TabBar(
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: themeColor,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: -3.0,
                                  blurRadius: 3.0,
                                ),
                              ],
                            ),
                            unselectedLabelColor: Colors.black45,
                            labelColor: Colors.white,
                            labelStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.1,
                              color: Colors.white,
                            ),
                            unselectedLabelStyle: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                            tabs: const [
                              Tab(
                                text: 'DEPARTMENT',
                              ),
                              Tab(
                                text: 'EMPLOYEE',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
