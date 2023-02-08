import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Employee/abstract_emps_view.dart';
import 'package:ooad_vubaochau/Employee/employee_detail.dart';
import 'package:ooad_vubaochau/Employee/employee_item.dart';
import 'package:ooad_vubaochau/Employee/emps_list_presenter.dart';
import 'package:ooad_vubaochau/Models/Employee_Models/employee_item_model.dart';
import 'package:ooad_vubaochau/styleguide/colors.dart';
import 'package:ooad_vubaochau/styleguide/text_style.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> with EmpsMngScreenView {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);

  List<EmployeeItemModel> listEmployee = [];
  List<EmployeeItemModel> searchList = [];

  late EmpMngListPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = EmpMngListPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black54,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/position_right.png',
            ),
            fit: BoxFit.cover,
            opacity: 0.3,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: kToolbarHeight + MediaQuery.of(context).padding.top,
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 8,
              ),
              child: Center(
                child: Text(
                  "Employee's List",
                  style: headingTextStyle.copyWith(
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  cursorColor: themeColor,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    prefixIconColor: themeColor,
                    focusColor: themeColor,
                    hintText: "\"Name\" of Employee",
                    hintStyle:
                        whiteSubHeadingTextStyle.copyWith(color: hintTextColor),
                  ),
                  onChanged: search,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Đang làm việc",
                style: titleStyle.copyWith(color: Colors.black),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return EmployeeDetailProfile(
                              employee: searchList[index],
                            );
                          },
                        ),
                      );
                    },
                    child: EmployeeItem(
                      employee: searchList[index],
                    ),
                  );
                },
                itemCount: searchList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void getListEmps(List<EmployeeItemModel> listEmp) {
    if (mounted) {
      setState(() {
        listEmployee = listEmp;
        searchList = listEmp;
      });
    }
  }

  void search(String query) {
    final suggestion = listEmployee.where((element) {
      final empName = element.name.toLowerCase();
      final input = query.toLowerCase();

      return empName.contains(input);
    }).toList();

    setState(() {
      searchList = suggestion;
    });
  }
}
