import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ooad_vubaochau/Features/Task/add_label_dialog.dart';
import 'package:ooad_vubaochau/Models/Task_Models/label.dart';
import 'package:ooad_vubaochau/Models/Task_Models/manager_task.dart';

import 'hastag_task.dart';

class MyEditBottomSheet extends StatefulWidget {
  final void Function(ManagerTaskModel) callback;
  final ManagerTaskModel item;
  const MyEditBottomSheet(
      {super.key, required this.callback, required this.item});

  @override
  State<MyEditBottomSheet> createState() => _MyEditBottomSheetState();
}

class _MyEditBottomSheetState extends State<MyEditBottomSheet> {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  late List<MyLabelModel> newListLabel = [];
  late List<String> newListMembers = [];
  late TextEditingController titleControl;
  late TextEditingController descControl;
  DateFormat dateFormat = DateFormat('MMM d, yyyy');
  late DateTime newDate;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    titleControl = TextEditingController(text: widget.item.title);
    descControl = TextEditingController(text: widget.item.subTitle);
    newDate = DateFormat('MMM d, yyy').parse(widget.item.date);
    newListLabel = List<MyLabelModel>.from(widget.item.label);
    newListMembers = List<String>.from(widget.item.members);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 18),
      height: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "EDIT MY TASK",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              const Icon(
                Icons.edit,
                color: Colors.black,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  widget.callback(
                    ManagerTaskModel(
                      titleControl.text,
                      newListLabel,
                      descControl.text,
                      dateFormat.format(newDate),
                      newListMembers,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 0,
                ),
                child: Row(
                  children: [
                    Text(
                      'Done',
                      style: TextStyle(
                        color: themeColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      Icons.done,
                      color: themeColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: titleControl,
            cursorColor: themeColor,
            style: const TextStyle(fontSize: 16),
            decoration: InputDecoration(
              hintText: "Task's title",
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: themeColor,
                  width: 3,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: themeColor,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: themeColor,
                  width: 2,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: const [
              Icon(Icons.library_books_outlined),
              SizedBox(
                width: 4,
              ),
              Text(
                "Description",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 16,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          SizedBox(
            height: 24 * 5,
            child: TextField(
              textInputAction: TextInputAction.done,
              controller: descControl,
              cursorColor: themeColor,
              maxLines: 5,
              style: const TextStyle(fontSize: 16),
              maxLength: 150,
              decoration: InputDecoration(
                hintText: "Add a more detailed description...",
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: themeColor,
                    width: 3,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: themeColor,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: themeColor,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: const [
              Icon(Icons.watch_later_outlined),
              SizedBox(
                width: 4,
              ),
              Text(
                "Due date",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 16,
                ),
              )
            ],
          ),
          Container(
            height: 40,
            margin: const EdgeInsets.only(
              top: 4,
              bottom: 6,
            ),
            child: ElevatedButton(
              onPressed: () {
                showDatePicker(
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                        primary: themeColor,
                        onPrimary: Colors.white,
                      )),
                      child: child!,
                    );
                  },
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2022),
                  lastDate: DateTime(2100),
                ).then((value) {
                  if (value != null) {
                    setState(() {
                      newDate = value;
                    });
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.grey[300],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dateFormat.format(newDate),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: const [
              Icon(Icons.label_outline),
              SizedBox(
                width: 4,
              ),
              Text(
                "Labels",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 16,
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 4, bottom: 6),
            height: 38,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return index == newListLabel.length
                    ? Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[350],
                        ),
                        alignment: Alignment.center,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.add_rounded,
                            size: 24,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AddLabelDialog(
                                  callback: (p0) {
                                    setState(() {
                                      newListLabel.add(p0);
                                    });
                                  },
                                );
                              },
                            );
                          },
                        ),
                      )
                    : index == newListLabel.length + 1
                        ? newListLabel.isNotEmpty
                            ? Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[350],
                                ),
                                alignment: Alignment.center,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(
                                    Icons.close,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      newListLabel.clear();
                                    });
                                  },
                                ),
                              )
                            : Container()
                        : TaskHastag(label: newListLabel[index]);
              },
              itemCount: newListLabel.length + 2,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Row(
            children: const [
              Icon(Icons.person_outline),
              SizedBox(
                width: 4,
              ),
              Text(
                "Members",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 16,
                ),
              )
            ],
          ),
          Container(
            height: 124,
            margin: const EdgeInsets.only(top: 4, bottom: 6),
            child: GridView.builder(
              itemCount: newListMembers.length + 1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                return index == newListMembers.length
                    ? Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[350],
                        ),
                        margin: const EdgeInsets.only(left: 4, right: 4),
                        alignment: Alignment.center,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.person_add_alt_1_rounded),
                          onPressed: () {
                            setState(() {
                              newListMembers.add("New employee");
                            });
                          },
                        ),
                      )
                    : GestureDetector(
                        onTapDown: (details) {
                          showMenu(
                            shape: const CircleBorder(),
                            context: context,
                            position: RelativeRect.fromLTRB(
                              details.globalPosition.dx - 20,
                              details.globalPosition.dy,
                              details.globalPosition.dx,
                              details.globalPosition.dy,
                            ),
                            items: [
                              PopupMenuItem(
                                child: const Center(
                                  child: Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    newListMembers.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 4, right: 4),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: themeColor,
                              width: 1,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'images/employee.jpg',
                              fit: BoxFit.contain,
                              width: 47,
                              height: 47,
                            ),
                          ),
                        ),
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
