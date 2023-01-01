import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Features/Task/task_item.dart';
import 'package:ooad_vubaochau/Models/Task_Models/manager_task.dart';

import '../../Models/Task_Models/label.dart';

class EmployeeTaskList extends StatefulWidget {
  const EmployeeTaskList({super.key});

  @override
  State<EmployeeTaskList> createState() => _EmployeeTaskListState();
}

class _EmployeeTaskListState extends State<EmployeeTaskList> {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  List<ManagerTaskModel> taskList = getTaskList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: const Text(
          'My Task',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75),
                  ),
                ],
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Need to do',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.sort,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 11,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return TaskItem(
                  task: taskList[index],
                );
              },
              itemCount: taskList.length,
            ),
          ),
        ],
      ),
    );
  }
}

List<ManagerTaskModel> getTaskList() {
  List<ManagerTaskModel> list = [
    ManagerTaskModel(
      'Design UI Mobile',
      [
        MyLabelModel('Dev', Colors.lightBlue),
        MyLabelModel('UI', Colors.amber),
        MyLabelModel('Mobi', Colors.cyan),
      ],
      'This is subtitle of task item',
      'Nov 20, 2022',
      ["", "", ""],
    ),
    ManagerTaskModel(
      'Testing UI Mobile',
      [
        MyLabelModel('Test', Colors.pink),
        MyLabelModel('UI', Colors.amber),
        MyLabelModel('Mobi', Colors.cyan),
      ],
      'This is subtitle of task item\nThis is subtitle of task item\nThis is subtitle of task item',
      'Nov 30, 2022',
      ["", "", ""],
    ),
    ManagerTaskModel(
      'Design UI Web',
      [
        MyLabelModel('Dev', Colors.lightBlue),
        MyLabelModel('UI', Colors.amber),
        MyLabelModel('Web', Colors.deepOrange),
      ],
      'This is subtitle of task item',
      'Nov 20, 2022',
      ["", "", ""],
    ),
    ManagerTaskModel(
      'Testing UI Web',
      [
        MyLabelModel('Test', Colors.pink),
        MyLabelModel('UI', Colors.amber),
        MyLabelModel('Web', Colors.deepOrange),
      ],
      'This is subtitle of task item',
      'Nov 30, 2022',
      ["", "", ""],
    ),
    ManagerTaskModel(
      'Design Database',
      [
        MyLabelModel('Dev', Colors.lightBlue),
        MyLabelModel('BE', Colors.deepPurple),
      ],
      'This is subtitle of task item\nThis is subtitle of task item',
      'Nov 30, 2022',
      ["", "", ""],
    ),
    ManagerTaskModel(
      'Testing Database',
      [
        MyLabelModel('Test', Colors.pink),
        MyLabelModel('BE', Colors.deepPurple),
      ],
      'This is subtitle of task item\nThis is subtitle of task item\nThis is subtitle of task item',
      'Nov 30, 2022',
      ["", "", ""],
    ),
    ManagerTaskModel(
      'Update Some Feature',
      [
        MyLabelModel('Dev', Colors.lightBlue),
        MyLabelModel('Web', Colors.deepOrange),
        MyLabelModel('Mobi', Colors.cyan),
      ],
      'This is subtitle of task item',
      'Dec 30, 2022',
      ["", "", "", ""],
    ),
    ManagerTaskModel(
      'Update UI Web',
      [
        MyLabelModel('Dev', Colors.lightBlue),
        MyLabelModel('Web', Colors.deepOrange),
        MyLabelModel('UI', Colors.amber),
      ],
      'This is subtitle of task item\nThis is subtitle of task item',
      'Dec 30, 2022',
      ["", "", "", ""],
    ),
  ];
  for (var task in list) {
    task.label.sort((a, b) {
      return a.text.length.compareTo(b.text.length);
    });
  }
  return list;
}
