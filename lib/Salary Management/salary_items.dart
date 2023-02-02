import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ooad_vubaochau/Salary%20Management/hastag_salary.dart';
import 'package:ooad_vubaochau/Models/Salary_Models/manager_salary.dart';
import 'package:ooad_vubaochau/commons/rounded_image.dart';

class SalaryItem extends StatelessWidget {
  final ManagerSalaryModel salary;
  const SalaryItem({super.key, required this.salary});

  @override
  Widget build(BuildContext context) {
    Color themeColor = const Color.fromARGB(215, 24, 167, 176);
    int dayLeft = daysBetween(convertStringToDate(salary.date), DateTime.now());
    String dayLeftString = countDayString(dayLeft);
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 18,
          right: 8,
          top: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  salary.nameEmp,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Container(
                  width: 6,
                  height: 6,
                  margin: const EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: dayLeft >= 0 ? Colors.grey : Colors.red[300],
                  ),
                ),
                Text(
                  dayLeftString,
                  style: TextStyle(
                    color: dayLeft >= 0 ? Colors.grey : Colors.red[300],
                    fontSize: 14,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              height: 18,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index1) {
                  return SalaryHastag(
                    label: salary.label[index1],
                  );
                },
                itemCount: salary.label.length,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              salary.salaryGain,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
                color: Colors.black54,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: themeColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: Colors.white,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        salary.date,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  salary.score.toStringAsFixed(1),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow[600],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  DateTime convertStringToDate(String dateString) {
    return DateFormat("MMM dd, yyyy").parse(dateString);
  }

  int daysBetween(DateTime end, DateTime now) {
    return end.difference(now).inDays;
  }

  String countDayString(int value) {
    if (value >= 0) {
      if (value == 1) {
        return "1 day left";
      } else {
        return "$value days left";
      }
    } else {
      if (value == -1) {
        return "1 day ago";
      } else {
        return "${value.abs()} days ago";
      }
    }
  }
}
