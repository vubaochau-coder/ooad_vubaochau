import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/styleguide/colors.dart';
import 'package:ooad_vubaochau/styleguide/text_style.dart';
import 'package:ooad_vubaochau/commons/narrow_app_bar.dart';

class EmployeeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NarrowAppBar(
        leading: Icon(Icons.arrow_back),
        trailing: Text(
          "SELECT",
          style: actionMenuStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Employee's List",
              style: headingTextStyle.copyWith(color: Colors.black),
            ),
          ),
          Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search",
                    hintStyle: whiteSubHeadingTextStyle.copyWith(
                        color: hintTextColor)),
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
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
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
                Spacer(),
                Text(
                  "1h",
                  style: subTitleStyle.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: ListTile(
                      title: Text(
                        "Nguyễn Trương Đình Du",
                        style: titleStyle,
                      ),
                      subtitle: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(
                              "images/task.jpg",
                              width: 15.0,
                              height: 15.0,
                              color: Colors.black,
                            ),
                            Text(
                              "  Fron-end Developer",
                              style: whiteSubHeadingTextStyle.copyWith(
                                  color: Colors.black, fontSize: 14),
                            ),
                          ]),
                      leading: ClipOval(
                        child: Image.asset(
                          "images/employee.jpg",
                          width: 50,
                          height: 50,
                        ),
                      ),
                      trailing: SizedBox(
                          width: 75,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 15,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      "Đang làm việc",
                                      style: whiteSubHeadingTextStyle.copyWith(
                                          color: Colors.green, fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Icon(
                                  Icons.phone_sharp,
                                  color: blueColor,
                                ),
                              ),
                            ],
                          ))),
                );
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
