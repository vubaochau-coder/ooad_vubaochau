import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ooad_vubaochau/Features/Task/bottom_sheet.dart';
import 'package:ooad_vubaochau/Features/Task/task_item.dart';
import 'package:ooad_vubaochau/Models/Task_Models/label.dart';
import 'package:ooad_vubaochau/Models/Task_Models/manager_task.dart';

class ManagerTaskList extends StatefulWidget {
  const ManagerTaskList({super.key});

  @override
  State<ManagerTaskList> createState() => _ManagerTaskListState();
}

class _ManagerTaskListState extends State<ManagerTaskList> {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  List<ManagerTaskModel> taskList = getTaskList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: themeColor,
        title: const Text(
          'In Progress',
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
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            builder: (BuildContext context) {
              return MyBottomSheet(callback: (p0) {
                setState(() {
                  taskList.insert(0, p0);
                  Navigator.pop(context);
                });
              });
            },
          );
        },
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Task management',
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
          Expanded(
            flex: 11,
            child: ListView.builder(
              itemBuilder: (context, index) {
                final ManagerTaskModel task = taskList[index];
                return Slidable(
                  startActionPane: ActionPane(
                    motion: const StretchMotion(),
                    extentRatio: 2 / 3,
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Task... deleted!"),
                            ),
                          );
                          setState(() {
                            taskList.removeAt(index);
                          });
                        },
                        icon: Icons.delete,
                        label: "Delete",
                        backgroundColor: Colors.red,
                      ),
                      SlidableAction(
                        onPressed: (context) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Task... Edited!"),
                            ),
                          );
                        },
                        icon: Icons.edit,
                        label: "Edit",
                        backgroundColor: Colors.blue,
                      ),
                      SlidableAction(
                        onPressed: (context) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Task... done!"),
                            ),
                          );
                        },
                        icon: Icons.done_outline_rounded,
                        label: "Done",
                        backgroundColor: themeColor.withAlpha(200),
                      ),
                    ],
                  ),
                  child: buildTaskList(task),
                );
              },
              itemCount: taskList.length,
            ),
          )
        ],
      ),
    );
  }

  Widget buildTaskList(ManagerTaskModel task) {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          final slidable = Slidable.of(context)!;
          final isClosed = slidable.actionPaneType.value == ActionPaneType.none;
          if (isClosed) {
            slidable.openStartActionPane();
          } else {
            slidable.close();
          }
        },
        child: TaskItem(task: task),
      ),
    );
  }

  static List<ManagerTaskModel> getTaskList() {
    List<ManagerTaskModel> list = [
      ManagerTaskModel(
        'Design UI Mobile',
        [
          MyLabelModel('Dev', Colors.lightBlue),
          MyLabelModel('UI', Colors.amber),
          MyLabelModel('Mobi', Colors.cyan),
        ],
        'This is subtitle of task item',
        'Nov 20',
        2,
      ),
      ManagerTaskModel(
        'Testing UI Mobile',
        [
          MyLabelModel('Test', Colors.pink),
          MyLabelModel('UI', Colors.amber),
          MyLabelModel('Mobi', Colors.cyan),
        ],
        'This is subtitle of task item\nThis is subtitle of task item\nThis is subtitle of task item',
        'Nov 30',
        3,
      ),
      ManagerTaskModel(
        'Design UI Web',
        [
          MyLabelModel('Dev', Colors.lightBlue),
          MyLabelModel('UI', Colors.amber),
          MyLabelModel('Web', Colors.deepOrange),
        ],
        'This is subtitle of task item',
        'Nov 20',
        2,
      ),
      ManagerTaskModel(
        'Testing UI Web',
        [
          MyLabelModel('Test', Colors.pink),
          MyLabelModel('UI', Colors.amber),
          MyLabelModel('Web', Colors.deepOrange),
        ],
        'This is subtitle of task item',
        'Nov 30',
        3,
      ),
      ManagerTaskModel(
        'Design Database',
        [
          MyLabelModel('Dev', Colors.lightBlue),
          MyLabelModel('BE', Colors.deepPurple),
        ],
        'This is subtitle of task item\nThis is subtitle of task item',
        'Nov 30',
        3,
      ),
      ManagerTaskModel(
        'Testing Database',
        [
          MyLabelModel('Test', Colors.pink),
          MyLabelModel('BE', Colors.deepPurple),
        ],
        'This is subtitle of task item\nThis is subtitle of task item\nThis is subtitle of task item',
        'Nov 30',
        3,
      ),
      ManagerTaskModel(
        'Update Some Feature',
        [
          MyLabelModel('Dev', Colors.lightBlue),
          MyLabelModel('Web', Colors.deepOrange),
          MyLabelModel('Mobi', Colors.cyan),
        ],
        'This is subtitle of task item',
        'Dec 30',
        4,
      ),
      ManagerTaskModel(
        'Update UI Web',
        [
          MyLabelModel('Dev', Colors.lightBlue),
          MyLabelModel('Web', Colors.deepOrange),
          MyLabelModel('UI', Colors.amber),
        ],
        'This is subtitle of task item\nThis is subtitle of task item',
        'Dec 30',
        4,
      ),
    ];
    for (var task in list) {
      task.label.sort((a, b) {
        return a.text.length.compareTo(b.text.length);
      });
    }
    return list;
  }
}
