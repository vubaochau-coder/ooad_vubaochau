import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ooad_vubaochau/Features/RequirementForm/bottom_sheet.dart';
import 'package:ooad_vubaochau/Features/RequirementForm/required_item.dart';
import 'package:ooad_vubaochau/Models/Requirement_Models/manager_requirement.dart';

class ManagerRequiredList extends StatefulWidget {
  const ManagerRequiredList({super.key});

  @override
  State<ManagerRequiredList> createState() => _ManagerRequiredListState();
}

class _ManagerRequiredListState extends State<ManagerRequiredList> {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  List<ManagerRequiredModel> taskList = getTaskList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: themeColor,
        title: const Text(
          'Requirement',
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
              return RequiredBottomSheet(callback: (p0) {
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
                    'Requirement Form Management',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
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
                final ManagerRequiredModel task = taskList[index];
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

  Widget buildTaskList(ManagerRequiredModel task) {
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
        child: RequiredItem(query: task),
      ),
    );
  }

  static List<ManagerRequiredModel> getTaskList() {
    List<ManagerRequiredModel> list = [
      ManagerRequiredModel(
        'Change position',
        'This is subtitle of Requirement Form',
        'Nov 20',
        2,
      ),
      ManagerRequiredModel(
        'Offer salary before the end of month',
        'This is subtitle of Requirement Form\nThis is subtitle of Requirement Form\nThis is subtitle of Requirement Form',
        'Nov 30',
        3,
      ),
      ManagerRequiredModel(
        'Complain about the header of the office',
        'This is subtitle of Requirement Form',
        'Nov 20',
        2,
      ),
      ManagerRequiredModel(
        'Suggest for the Holiday Tet',
        'This is subtitle of task item',
        'Nov 30',
        3,
      ),
      ManagerRequiredModel(
        'Confirm Salary',
        'This is subtitle of Requirement Form\nThis is subtitle of Requirement Form',
        'Nov 30',
        3,
      ),
      ManagerRequiredModel(
        'Offer position for the company',
        'This is subtitle of Requirement Form\nThis is subtitle of Requirement Form\nThis is subtitle of Requirement Form',
        'Nov 30',
        3,
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
