import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ooad_vubaochau/Models/Task_Models/test_emp_model.dart';
import 'package:ooad_vubaochau/Task%20Manager/abstract_task_view.dart';
import 'package:ooad_vubaochau/Task%20Manager/bottom_sheet.dart';
import 'package:ooad_vubaochau/Task%20Manager/edit_bottom_sheet.dart';
import 'package:ooad_vubaochau/QuanLyNhanVien/nhan_vien_item.dart';
import 'package:ooad_vubaochau/Models/Task_Models/manager_task.dart';
import 'package:ooad_vubaochau/Task%20Manager/task_list_4_manager_presenter.dart';

class ManagerTaskList extends StatefulWidget {
  const ManagerTaskList({super.key});

  @override
  State<ManagerTaskList> createState() => _ManagerTaskListState();
}

class _ManagerTaskListState extends State<ManagerTaskList>
    with AbstractTaskView {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  List<ManagerTaskModel> taskList = [];
  List<MemberInTask> allEmpsInDepart = [];

  final toast = FToast();
  late TaskManagerScreenPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = TaskManagerScreenPresenter(this);
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
                onComplete: (p0) async {
                  await presenter.addNewTask(p0).whenComplete(
                        () => Navigator.pop(context),
                      );
                },
                onExit: () {
                  Navigator.pop(context);
                },
                allEmpsInDepart: allEmpsInDepart,
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
                            presenter.removeTask(taskList[index].id);
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
                                    presenter.updateTask(p0);
                                    Navigator.pop(context);
                                  },
                                  item: taskList[index],
                                  onExit: () {
                                    Navigator.pop(context);
                                  },
                                  allEmpsInDepart: allEmpsInDepart,
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
                            presenter.completeTask(taskList[index]);
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
        child: ItemNhanVien(task: task),
      ),
    );
  }

  @override
  void showSuccessToast(String title) => Fluttertoast.showToast(
        msg: title,
        fontSize: 16,
        gravity: ToastGravity.BOTTOM,
      );

  @override
  void updateListView(List<ManagerTaskModel> task) {
    if (mounted) {
      setState(() {
        taskList = task;
      });
    }
  }

  @override
  void deleteSuccessful(String toast) => Fluttertoast.showToast(
        msg: toast,
        fontSize: 16,
        gravity: ToastGravity.BOTTOM,
      );

  @override
  void getAllEmpsInDepart(List<MemberInTask> emps) {
    if (mounted) {
      setState(() {
        allEmpsInDepart = emps;
      });
    }
  }
}
