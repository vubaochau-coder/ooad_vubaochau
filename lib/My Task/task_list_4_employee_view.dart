import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/My%20Task/abstract_my_task_view.dart';
import 'package:ooad_vubaochau/My%20Task/my_task_presenter.dart';
import 'package:ooad_vubaochau/Task%20Manager/task_item.dart';
import 'package:ooad_vubaochau/Models/Task_Models/manager_task.dart';

class EmployeeTaskList extends StatefulWidget {
  const EmployeeTaskList({super.key});

  @override
  State<EmployeeTaskList> createState() => _EmployeeTaskListState();
}

class _EmployeeTaskListState extends State<EmployeeTaskList>
    with AbstractMyTaskListView {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  late MyTaskScreenPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = MyTaskScreenPresenter(this);
  }

  List<ManagerTaskModel> taskList = [];
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

  @override
  void getListTask(List<ManagerTaskModel> listData) {
    if (mounted) {
      setState(() {
        taskList = listData;
      });
    }
  }
}
