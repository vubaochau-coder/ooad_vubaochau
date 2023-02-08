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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 12,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [
              Color(0xff7CFFCB),
              Color(0xffB0F3F1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListTile(
          minLeadingWidth: 58,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 8),
            child: Row(
              children: [
                Text(
                  employee.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryTextColor,
                  ),
                ),
                const Spacer(),
                Text(
                  employee.levelPer == 1
                      ? 'Admin'
                      : employee.levelPer == 2
                          ? 'Manager'
                          : 'Staff',
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
              ],
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
          leading: Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black54,
              ),
            ),
            child: ClipOval(
              child: Image.network(
                employee.imgURL,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'images/employee.jpg',
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
