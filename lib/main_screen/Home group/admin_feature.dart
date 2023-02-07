import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Custom%20widget/manager_operation_button.dart';
import 'package:ooad_vubaochau/Permission/manage_permission.dart';
import 'package:ooad_vubaochau/Department/manage_department.dart';

class AdminFeatures extends StatelessWidget {
  const AdminFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    Color themeColor = const Color.fromARGB(215, 24, 167, 176);
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.admin_panel_settings,
                color: themeColor,
              ),
              Text(
                'Admin',
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
              Future.delayed(const Duration(milliseconds: 150), () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const ManagePermissionScreen();
                    },
                  ),
                );
              });
            },
            child: const ManagerOperations(
              text: 'Permission management',
              icon: Icons.manage_accounts_outlined,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(12),
            splashColor: themeColor,
            onTap: () {
              Future.delayed(const Duration(milliseconds: 150), () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const ManageDepartmentScreen();
                    },
                  ),
                );
              });
            },
            child: const ManagerOperations(
              text: 'Position management',
              icon: Icons.person_pin,
            ),
          ),
        ],
      ),
    );
  }
}
