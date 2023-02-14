import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:ooad_vubaochau/Salary%20Management/abstract_salary_view.dart';
import 'package:ooad_vubaochau/Salary%20Management/bottom_sheet.dart';
import 'package:ooad_vubaochau/Salary%20Management/edit_bottom_sheet.dart';
import 'package:ooad_vubaochau/Salary%20Management/salary_items.dart';
import 'package:ooad_vubaochau/Models/Salary_Models/manager_salary.dart';
import 'package:ooad_vubaochau/Salary%20Management/salary_list_presenter.dart';

class ManagerSalaryList extends StatefulWidget {
  const ManagerSalaryList({super.key});

  @override
  State<ManagerSalaryList> createState() => _ManagerSalaryListState();
}

class _ManagerSalaryListState extends State<ManagerSalaryList>
    with AbstractSalaryView {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  List<ManagerSalaryModel> salaryList = [];

  late SalaryManagementScreenPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = SalaryManagementScreenPresenter(this);
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
                'Salary management',
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
                  final ManagerSalaryModel task = salaryList[index];
                  return Slidable(
                    startActionPane: ActionPane(
                      motion: const StretchMotion(),
                      extentRatio: 2 / 3,
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            setState(() {
                              salaryList.removeAt(index);
                            });
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
                                return SalaryEditBottomSheet(
                                  onComplete: (p0) {
                                    setState(() {
                                      salaryList[index] = p0;
                                      Navigator.pop(context);
                                    });
                                  },
                                  item: salaryList[index],
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
                          onPressed: (context) {},
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
                itemCount: salaryList.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTaskList(ManagerSalaryModel salary) {
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
        child: SalaryItem(salary: salary),
      ),
    );
  }

  @override
  void updateListView(List<ManagerSalaryModel> salary) {
    if (mounted) {
      setState(() {
        salaryList = salary;
      });
    }
  }
}
