import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Custom%20widget/my_operation_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Color themeColor = const Color.fromARGB(215, 24, 167, 176);

class _HomeScreenState extends State<HomeScreen> {
  double iconSize = 62;
  double paddingContainer = 16;
  double borderRadius = 16;

  String fullName = "VU BAO CHAU";
  String position = "BACK-END DEVELOPER";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
          'Home',
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          )
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(215, 24, 167, 176),
                Color.fromARGB(215, 24, 167, 176),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        elevation: 0,
      ),
      drawer: const NavigationDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: themeColor,
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 10,
                        ),
                        height: 64,
                        width: 64,
                        child: const CircleAvatar(
                          backgroundImage: AssetImage('images/avatar.jpg'),
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
            Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 30,
                bottom: 30,
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
                            'Employee', Icons.manage_accounts_outlined),
                        onTap: () {},
                      ),
                      InkWell(
                        splashColor: themeColor,
                        borderRadius: BorderRadius.circular(12),
                        child:
                            const OperationButton('Salary', Icons.attach_money),
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: themeColor,
                        borderRadius: BorderRadius.circular(12),
                        child: const OperationButton(
                            'Task', Icons.checklist_rounded),
                        onTap: () {},
                      ),
                      InkWell(
                        splashColor: themeColor,
                        borderRadius: BorderRadius.circular(12),
                        child: const OperationButton(
                            'Attendance', Icons.library_add_check_outlined),
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.app_registration,
                        color: themeColor,
                      ),
                      Text(
                        'Manager',
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
                  Material(
                    color: themeColor,
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      splashColor: Colors.white70,
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                          top: 12,
                          bottom: 12,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.transparent,
                          border: Border.all(
                            color: themeColor,
                          ),
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.request_page_rounded,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'View salary report',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 17,
                              ),
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Material(
                    color: themeColor,
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      splashColor: Colors.white70,
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                          top: 12,
                          bottom: 12,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.transparent,
                          border: Border.all(
                            color: themeColor,
                          ),
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.task,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'View task report',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 17,
                              ),
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) {
    return Container(
      color: const Color.fromARGB(215, 24, 167, 176),
      padding: EdgeInsets.only(
        top: 24 + MediaQuery.of(context).padding.top,
        bottom: 24,
      ),
      child: Column(
        children: const [
          CircleAvatar(
            radius: 44,
            backgroundImage: AssetImage('images/avatar.jpg'),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Vu Bao Chau',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            'baochau@gmail.com',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.person_outline,
            color: themeColor,
          ),
          title: const Text(
            'My profile',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.logout_rounded,
            color: themeColor,
          ),
          title: const Text(
            'Log out',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          onTap: () {},
        )
      ],
    );
  }
}
