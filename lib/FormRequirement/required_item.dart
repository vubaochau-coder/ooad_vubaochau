import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Models/Requirement_Models/manager_requirement.dart';
import 'package:intl/intl.dart';

class RequiredItem extends StatelessWidget {
  final ManagerRequiredModel query;
  const RequiredItem({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    Color themeColor = const Color.fromARGB(215, 24, 167, 176);
    int dayleft = daysBetween(convertStringToDate(query.date), DateTime.now());
    String daylefttoString = countDayString(dayleft);
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 8, top: 12, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  query.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                Container(
                  width: 6,
                  height: 6,
                  margin: const EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: dayleft >= 0 ? Colors.grey : Colors.red[300],
                  ),
                ),
                Text(
                  daylefttoString,
                  style: TextStyle(
                    color: dayleft >= 0 ? Colors.grey : Colors.red[300],
                    fontSize: 14,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              query.subTitle,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
                color: Colors.black54,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              'To: ${query.nameManager}',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            Row(
              children: [
                const Text('Status: '),
                Text(
                  query.status,
                  style: TextStyle(
                    color: query.status == 'Sended'
                        ? Colors.blue
                        : query.status == 'Accepted'
                            ? Colors.green
                            : Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
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
