import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
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
      body: Container(
        decoration: BoxDecoration(
          color: themeColor,
          image: const DecorationImage(
            image: AssetImage('images/demo.jpg'),
            fit: BoxFit.cover,
            opacity: 0.2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white70,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 8, bottom: 12),
              child: const Text(
                'Requirement',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                  color: Colors.white70,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 22),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                      cursorColor: Colors.white54,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        hintText: 'Title of Requirement',
                        hintStyle: const TextStyle(
                          color: Colors.black38,
                        ),
                        fillColor: Colors.transparent,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 16),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(
                            color: Colors.white70,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(
                            color: Colors.white70,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(
                            color: Colors.white70,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white70,
                          width: 2,
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.sort,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: GroupedListView(
                  elements: taskList,
                  groupBy: (element) => element.date,
                  padding: const EdgeInsets.only(top: 8),
                  groupSeparatorBuilder: (value) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(
                        left: 12,
                      ),
                      margin: const EdgeInsets.only(
                          left: 4, right: 4, bottom: 2, top: 8),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  },
                  itemBuilder: (context, element) {
                    return buildTaskList(element);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTaskList(ManagerRequiredModel task) {
    return RequiredItem(query: task);
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
    return list;
  }
}
