import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ooad_vubaochau/Custom%20widget/user_item_name_avt.dart';
import 'package:ooad_vubaochau/Task%20Manager/hastag_task.dart';
import 'package:ooad_vubaochau/Models/Task_Models/manager_task.dart';

class ItemNhanVien extends StatelessWidget {
  final ManagerTaskModel task;
  const ItemNhanVien({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    Color themeColor = const Color.fromARGB(215, 24, 167, 176);
    int dayLeft = daysBetween(convertStringToDate(task.date), DateTime.now());
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
                  task.title,
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
                  return TaskHastag(
                    label: task.label[index1],
                  );
                },
                itemCount: task.label.length,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              task.subTitle,
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
                        task.date,
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
                  task.score.toStringAsFixed(1),
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
            const SizedBox(
              height: 4,
            ),
            const Divider(
              color: Colors.black54,
              height: 0,
            ),
            ListTileTheme(
              contentPadding: EdgeInsets.zero,
              dense: true,
              selectedTileColor: Colors.transparent,
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  childrenPadding: EdgeInsets.zero,
                  tilePadding: EdgeInsets.zero,
                  title: Row(
                    children: [
                      Text(
                        "${task.members.length} members in Task.",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black45,
                          fontSize: 15,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'Details',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                  children: [
                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return AvatarNameUser(userInfo: task.members[index]);
                        },
                        itemCount: task.members.length,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              ),
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
