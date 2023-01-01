import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Features/Department/department_card.dart';
import 'package:ooad_vubaochau/Models/Department_Models/department_info_model.dart';

class DepartmentListScreen extends StatefulWidget {
  const DepartmentListScreen({super.key});

  @override
  State<DepartmentListScreen> createState() => _DepartmentListScreenState();
}

class _DepartmentListScreenState extends State<DepartmentListScreen> {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  List<DepartmentModel> listDepartment = getListDepartment();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: themeColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 50),
        itemBuilder: (context, index) {
          return buildDepartmentItem(listDepartment[index]);
        },
        itemCount: listDepartment.length,
      ),
    );
  }

  Widget buildDepartmentItem(DepartmentModel departmentModel) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4),
      child: DepartmentCard(
        departmentModel: departmentModel,
      ),
    );
  }

  static List<DepartmentModel> getListDepartment() {
    List<DepartmentModel> list = [
      DepartmentModel('Human sesources', '8', 'Vu Bao Chau', '0'),
      DepartmentModel('Marketing department', '6', 'Vu Bao Chau', '2'),
      DepartmentModel('Sales department', '7', 'Vu Bao Chau', '13'),
      DepartmentModel(
          'Information technology department', '18', 'Vu Bao Chau', '22'),
      DepartmentModel('Finance department', '4', 'Vu Bao Chau', '10'),
    ];
    return list;
  }
}
