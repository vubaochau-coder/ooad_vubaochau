import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Features/Department/department_card.dart';
import 'package:ooad_vubaochau/Models/Department_Models/department_info_model.dart';

class DepartmentListScreen extends StatefulWidget {
  const DepartmentListScreen({super.key});

  @override
  State<DepartmentListScreen> createState() => _DepartmentListScreenState();
}

class _DepartmentListScreenState extends State<DepartmentListScreen>
    with AutomaticKeepAliveClientMixin {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  List<DepartmentModel> listDepartment = getListDepartment();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: themeColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(
                  height: 180,
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 50),
                    itemBuilder: (context, index) {
                      return buildDepartmentItem(listDepartment[index]);
                    },
                    itemCount: listDepartment.length,
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
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(200, 30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        blurRadius: 14,
                        blurStyle: BlurStyle.normal,
                        spreadRadius: -14,
                        offset: Offset(7, 12),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 210,
                  decoration: BoxDecoration(
                    color: themeColor,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.elliptical(200, 30),
                    ),
                    image: const DecorationImage(
                      image: AssetImage('images/position_left.png'),
                      fit: BoxFit.cover,
                      opacity: 0.5,
                    ),
                  ),
                ),
                Container(
                  height: 210,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  child: const Text(
                    'Departments',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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

  @override
  bool get wantKeepAlive => true;
}
