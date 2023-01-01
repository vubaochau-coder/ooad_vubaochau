import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ooad_vubaochau/Features/Salary/bottom_sheet.dart';
import 'package:ooad_vubaochau/Features/Salary/salary_items.dart';
import 'package:ooad_vubaochau/Models/Salary_Models/label.dart';
import 'package:ooad_vubaochau/Models/Salary_Models/manager_salary.dart';

class ManagerTaskList extends StatefulWidget {
  const ManagerTaskList({super.key});

  @override
  State<ManagerTaskList> createState() => _ManagerTaskListState();
}

class _ManagerTaskListState extends State<ManagerTaskList> {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  List<ManagerSalaryModel> salaryList = getSalaryList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: themeColor,
        title: const Text(
          "Salary's Progress",
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
              return SalaryBottomSheet(callback: (p0) {
                setState(() {
                  salaryList.insert(0, p0);
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
                    'Salary management',
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
                final ManagerSalaryModel salary = salaryList[index];
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
                            salaryList.removeAt(index);
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
                  child: buildSalaryList(salary),
                );
              },
              itemCount: salaryList.length,
            ),
          )
        ],
      ),
    );
  }

  Widget buildSalaryList(ManagerSalaryModel salary) {
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

  static List<ManagerSalaryModel> getSalaryList() {
    List<ManagerSalaryModel> list = [
      ManagerSalaryModel(
        'Nguyen Truong Dinh Du',
        [
          SalaryLabelModel('Test', Colors.pink),
          SalaryLabelModel('UI', Colors.amber),
          SalaryLabelModel('Mobi', Colors.cyan),
        ],
        'This is subtitle of Personal Name',
        'Nov 30',
      ),
    ];
    for (var task in list) {
      task.Label.sort((a, b) {
        return a.Text.length.compareTo(b.Text.length);
      });
    }
    return list;
  }
}
