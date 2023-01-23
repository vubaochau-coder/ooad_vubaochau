import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Task%20Manager/task_item.dart';
import 'package:ooad_vubaochau/Models/Task_Models/manager_task.dart';

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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black54,
        title: const Text(
          'My Task',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
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
      body: Container(
        decoration: BoxDecoration(
          color: themeColor,
          image: const DecorationImage(
            image: AssetImage('images/position_right.png'),
            fit: BoxFit.cover,
            opacity: 0.4,
          ),
        ),
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top +
                AppBar().preferredSize.height),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(bottom: 20),
              child: const Text(
                'Need to do',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black54,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
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
      ),
    );
  }
}

List<ManagerTaskModel> getTaskList() {
  List<ManagerTaskModel> list = [
    // ManagerTaskModel(
    //   title: 'Design UI Mobile',
    //   label: [
    //     MyLabelModel('Dev', Colors.lightBlue),
    //     MyLabelModel('UI', Colors.amber),
    //     MyLabelModel('Mobi', Colors.cyan),
    //   ],
    //   subTitle: 'This is subtitle of task item',
    //   date: 'Nov 20, 2022',
    //   members: ["", "", ""],
    //   score: 6,
    // ),
    // ManagerTaskModel(
    //   title: 'Testing UI Mobile',
    //   label: [
    //     MyLabelModel('Test', Colors.pink),
    //     MyLabelModel('UI', Colors.amber),
    //     MyLabelModel('Mobi', Colors.cyan),
    //   ],
    //   subTitle:
    //       'This is subtitle of task itemThis is subtitle of task itemThis is subtitle of task item',
    //   date: 'Nov 30, 2022',
    //   members: ["", "", ""],
    //   score: 5,
    // ),
    // ManagerTaskModel(
    //   title: 'Design UI Web',
    //   label: [
    //     MyLabelModel('Dev', Colors.lightBlue),
    //     MyLabelModel('UI', Colors.amber),
    //     MyLabelModel('Web', Colors.deepOrange),
    //   ],
    //   subTitle: 'This is subtitle of task item',
    //   date: 'Nov 20, 2022',
    //   members: ["", "", ""],
    //   score: 9,
    // ),
    // ManagerTaskModel(
    //   title: 'Testing UI Web',
    //   label: [
    //     MyLabelModel('Test', Colors.pink),
    //     MyLabelModel('UI', Colors.amber),
    //     MyLabelModel('Web', Colors.deepOrange),
    //   ],
    //   subTitle: 'This is subtitle of task item',
    //   date: 'Nov 30, 2022',
    //   members: ["", "", ""],
    //   score: 7,
    // ),
    // ManagerTaskModel(
    //   title: 'Design Database',
    //   label: [
    //     MyLabelModel('Dev', Colors.lightBlue),
    //     MyLabelModel('BE', Colors.deepPurple),
    //   ],
    //   subTitle: 'This is subtitle of task item\nThis is subtitle of task item',
    //   date: 'Nov 30, 2022',
    //   members: ["", "", ""],
    //   score: 6,
    // ),
    // ManagerTaskModel(
    //   title: 'Testing Database',
    //   label: [
    //     MyLabelModel('Test', Colors.pink),
    //     MyLabelModel('BE', Colors.deepPurple),
    //   ],
    //   subTitle:
    //       'This is subtitle of task item\nThis is subtitle of task item\nThis is subtitle of task item',
    //   date: 'Nov 30, 2022',
    //   members: ["", "", ""],
    //   score: 4,
    // ),
    // ManagerTaskModel(
    //   title: 'Update Some Feature',
    //   label: [
    //     MyLabelModel('Dev', Colors.lightBlue),
    //     MyLabelModel('Web', Colors.deepOrange),
    //     MyLabelModel('Mobi', Colors.cyan),
    //   ],
    //   subTitle: 'This is subtitle of task item',
    //   date: 'Dec 30, 2022',
    //   members: ["", "", "", ""],
    //   score: 8,
    // ),
    // ManagerTaskModel(
    //   title: 'Update UI Web',
    //   label: [
    //     MyLabelModel('Dev', Colors.lightBlue),
    //     MyLabelModel('Web', Colors.deepOrange),
    //     MyLabelModel('UI', Colors.amber),
    //   ],
    //   subTitle: 'This is subtitle of task item\nThis is subtitle of task item',
    //   date: 'Dec 30, 2022',
    //   members: ["", "", "", ""],
    //   score: 5,
    // ),
  ];
  for (var task in list) {
    task.label.sort((a, b) {
      return a.text.length.compareTo(b.text.length);
    });
  }
  return list;
}
