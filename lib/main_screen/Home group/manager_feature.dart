import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Custom%20widget/manager_operation_button.dart';
import 'package:ooad_vubaochau/Features/Employee/employee_list.dart';
import 'package:ooad_vubaochau/main_screen/home_screen.dart';

class ManagerFeatures extends StatelessWidget {
  const ManagerFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    Color themeColor = const Color.fromARGB(215, 24, 167, 176);
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
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
          InkWell(
            borderRadius: BorderRadius.circular(12),
            splashColor: themeColor,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const EmployeeList();
                  },
                ),
              );
            },
            child: const ManagerOperations(
              text: 'Employee management',
              icon: Icons.people,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(12),
            splashColor: themeColor,
            onTap: () {},
            child: const ManagerOperations(
              text: 'Salary management',
              icon: Icons.request_quote,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(12),
            splashColor: themeColor,
            onTap: () {},
            child: const ManagerOperations(
              text: 'Task management',
              icon: Icons.task,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(12),
            splashColor: themeColor,
            onTap: () {},
            child: const ManagerOperations(
              text: 'Create notification',
              icon: Icons.notification_add,
            ),
          ),
        ],
      ),
    );
  }
}
