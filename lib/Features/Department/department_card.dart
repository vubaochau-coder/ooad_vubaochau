import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Models/Department_Models/department_info_model.dart';

class DepartmentCard extends StatelessWidget {
  final DepartmentModel departmentModel;
  const DepartmentCard({super.key, required this.departmentModel});

  @override
  Widget build(BuildContext context) {
    Color themeColor = const Color.fromARGB(215, 24, 167, 176);
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 22, top: 10, right: 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  departmentModel.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
                const Spacer(),
                InkWell(
                  splashColor: Colors.blue[100],
                  onTap: () {},
                  borderRadius: BorderRadius.circular(3),
                  child: Container(
                    width: 40,
                    //height: 28,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: const Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22, right: 22, bottom: 4),
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.man,
                      color: Colors.grey,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Manager: ${departmentModel.owner}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.task_alt,
                      color: Colors.grey,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "${departmentModel.taskCount} tasks succeeded",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '80% of the total',
                      style: TextStyle(
                        color: themeColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const Divider(
                  color: Colors.grey,
                  height: 1,
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.people_alt_outlined,
                      color: Colors.grey,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "${departmentModel.staffCount} members",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      splashColor: Colors.blue[200],
                      borderRadius: BorderRadius.circular(4),
                      onTap: () {},
                      child: Container(
                        height: 30,
                        padding: const EdgeInsets.only(left: 2, right: 2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              'Details',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
