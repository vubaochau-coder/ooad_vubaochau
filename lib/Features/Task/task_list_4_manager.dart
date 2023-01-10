import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ooad_vubaochau/Features/Task/bottom_sheet.dart';
import 'package:ooad_vubaochau/Features/Task/edit_bottom_sheet.dart';
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

  final toast = FToast();

  @override
  void initState() {
    super.initState();

    toast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black54,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
              ),
            ),
            builder: (BuildContext context) {
              return MyCreateBottomSheet(
                onComplete: (p0) {
                  setState(() {
                    taskList.insert(0, p0);
                    Navigator.pop(context);
                    showSuccessToast('Task has been created');
                  });
                },
                onExit: () {
                  Navigator.pop(context);
                },
              );
            },
          );
        },
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(bottom: 20),
              child: const Text(
                'Task management',
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
                  final ManagerTaskModel task = taskList[index];
                  return Slidable(
                    startActionPane: ActionPane(
                      motion: const StretchMotion(),
                      extentRatio: 2 / 3,
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            setState(() {
                              taskList.removeAt(index);
                            });
                            showSuccessToast('Task has been deleted');
                          },
                          icon: Icons.delete_outline,
                          label: "Delete",
                          backgroundColor: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(22),
                                  topRight: Radius.circular(22),
                                ),
                              ),
                              builder: (BuildContext context) {
                                return MyEditBottomSheet(
                                  onComplete: (p0) {
                                    setState(() {
                                      taskList[index] = p0;
                                      Navigator.pop(context);
                                      showSuccessToast('Task has been edited');
                                    });
                                  },
                                  item: taskList[index],
                                  onExit: () {
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            );
                          },
                          icon: Icons.edit_outlined,
                          label: "Edit",
                          backgroundColor: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            showSuccessToast('Task completed');
                          },
                          icon: Icons.done_outline_rounded,
                          label: "Done",
                          backgroundColor: themeColor.withAlpha(200),
                          borderRadius: BorderRadius.circular(10),
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

  void showSuccessToast(String title) => Fluttertoast.showToast(
        msg: title,
        fontSize: 18,
        gravity: ToastGravity.BOTTOM,
      );

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
        'This is subtitle of task itemThis is subtitle of task itemThis is subtitle of task item',
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
}
