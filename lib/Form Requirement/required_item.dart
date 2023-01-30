import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Models/Requirement_Models/manager_requirement.dart';
import 'package:ooad_vubaochau/commons/rounded_image.dart';
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
                Expanded(
                  flex: 2,
                  child: Text(
                    query.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsets.only(right: 4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
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
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              query.subTitle,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
                color: Colors.black54,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              width: 84,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: themeColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    query.date,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
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
                        "${query.members.length} members in Task.",
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
                          return Row(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(right: 8, bottom: 2),
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                    color: themeColor,
                                  ),
                                ),
                                child: const RoundedImage(
                                    imagePath: "images/employee.jpg"),
                              ),
                              const Text(
                                'Name of member',
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          );
                        },
                        itemCount: query.members.length,
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
