import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Features/Employee/employee_detail.dart';
import 'package:ooad_vubaochau/Features/Employee/employee_item.dart';
import 'package:ooad_vubaochau/Models/Employee_Models/employee_item_model.dart';
import 'package:ooad_vubaochau/styleguide/colors.dart';
import 'package:ooad_vubaochau/styleguide/text_style.dart';

class EmployeeList extends StatelessWidget {
  const EmployeeList({super.key});

  @override
  Widget build(BuildContext context) {
    Color themeColor = const Color.fromARGB(215, 24, 167, 176);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: themeColor,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'SELECT',
              style: actionMenuStyle,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 8,
            ),
            child: Text(
              "Employee's List",
              style: headingTextStyle.copyWith(color: Colors.black),
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
                  hintText: "Search",
                  hintStyle:
                      whiteSubHeadingTextStyle.copyWith(color: hintTextColor),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Text(
                  "Đang làm việc",
                  style: titleStyle.copyWith(color: Colors.black),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      "5",
                      style: whiteSubHeadingTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  "1h",
                  style: subTitleStyle.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
          Padding(
            padding:  const EdgeInsets.all(16),
            child: ListView.builder(
                itemBuilder: (context, index) {
                  EmployeeItemModel employeeItemModel = listEmp[index];
                  return Card(
                    child: ListTile(
                      title: Text(employeeItemModel.name),
                      subtitle: Text(
                          '${employeeItemModel.position}, ${employeeItemModel.year}'),
                      leading: Image.asset(employeeItemModel.imgPath),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
