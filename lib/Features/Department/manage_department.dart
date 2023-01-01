import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Features/Department/employee_deparment_list.dart';
import 'package:ooad_vubaochau/Features/Permission/staff_accounts.dart';
import 'package:ooad_vubaochau/Features/Department/department_list.dart';

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
                child: Column(
                  children: const [
                    SizedBox(
                      height: 180,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          DepartmentListScreen(),
                          DepartmentEmpListScreen(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 234,
                child: Stack(
                  children: [
                    Container(
                      height: 210,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(200, 30),
                        ),
                        image: DecorationImage(
                          image: AssetImage('images/position.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 210,
                      decoration: BoxDecoration(
                        color: themeColor.withOpacity(0.8),
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.elliptical(200, 30),
                        ),
                      ),
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
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              child: const Text(
                                'Departments',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
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
