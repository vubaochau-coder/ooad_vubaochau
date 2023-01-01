import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Features/Task/hastag_task.dart';
import 'package:ooad_vubaochau/Models/Task_Models/manager_task.dart';
import 'package:ooad_vubaochau/commons/rounded_image.dart';

class TaskItem extends StatelessWidget {
  final ManagerTaskModel task;
  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    Color themeColor = const Color.fromARGB(215, 24, 167, 176);
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
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                const Text(
                  '3 days left',
                  style: TextStyle(
                    color: Colors.grey,
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
                Container(
                  alignment: Alignment.centerRight,
                  width: 33 * 3 + 20,
                  height: 30,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 3),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            color: themeColor,
                          ),
                        ),
                        child: const RoundedImage(
                            imagePath: "images/employee.jpg"),
                      );
                    },
                    itemCount: task.members.length,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
