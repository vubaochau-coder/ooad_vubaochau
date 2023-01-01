import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Models/Employee_Models/employee_item_model.dart';
import 'package:ooad_vubaochau/styleguide/colors.dart';
import 'package:ooad_vubaochau/styleguide/text_style.dart';

class EmployeeItem extends StatelessWidget {
  final EmployeeItemModel employee;
  const EmployeeItem({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 12,
      ),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0, top: 8),
          child: Text(
            employee.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: primaryTextColor,
            ),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(
                Icons.content_paste,
                size: 15,
                color: Colors.black,
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: Text(
                  employee.position,
                  softWrap: true,
                  style: whiteSubHeadingTextStyle.copyWith(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        leading: ClipOval(
          child: Image.asset(
            employee.imgPath,
            width: 50,
            height: 50,
          ),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            ),
            SizedBox(
              width: 24,
              height: 24,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(
                  Icons.phone_sharp,
                  color: blueColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
