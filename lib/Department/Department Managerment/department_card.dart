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
            child: Text(
              departmentModel.name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
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
                      "Manager: ${departmentModel.manager}",
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
                      "${departmentModel.taskSuccess} tasks succeeded",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${(departmentModel.taskSuccess / departmentModel.taskTotal * 100).toStringAsFixed(0)}% of the total',
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
                ListTileTheme(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  selectedTileColor: Colors.transparent,
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      tilePadding: const EdgeInsets.only(right: 20),
                      childrenPadding: EdgeInsets.zero,
                      collapsedIconColor: themeColor,
                      collapsedTextColor: Colors.black,
                      iconColor: themeColor,
                      textColor: Colors.black,
                      title: Row(
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
                            "${departmentModel.idEmps.length} members",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(bottom: 6),
                          itemBuilder: (context, index) {
                            return Text(
                              departmentModel.idEmps[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            );
                          },
                          itemCount: departmentModel.idEmps.length,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
