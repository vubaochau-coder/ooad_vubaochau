import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ooad_vubaochau/Models/Salary_Models/test_label_model.dart';
import 'package:ooad_vubaochau/Salary%20Management/add_label_dialog.dart';
import 'package:ooad_vubaochau/Models/Salary_Models/manager_salary.dart';

import 'hastag_salary.dart';

class MyCreateBottomSheet extends StatefulWidget {
  final void Function(ManagerSalaryModel) onComplete;
  final VoidCallback onExit;
  const MyCreateBottomSheet(
      {super.key, required this.onComplete, required this.onExit});

  @override
  State<MyCreateBottomSheet> createState() => _MyCreateBottomSheetState();
}

class _MyCreateBottomSheetState extends State<MyCreateBottomSheet> {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  List<TestSalaryLabel> listLabel = [];
  TextEditingController titleControl = TextEditingController();
  TextEditingController descControl = TextEditingController();
  DateFormat dateFormat = DateFormat('MMM d, yyyy');
  DateTime myDate = DateTime.now();
  double rating = 5;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.transparent,
      height: 639,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            child: Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: widget.onExit,
                  child: Container(
                    height: 50,
                    color: Colors.transparent,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: widget.onExit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            widget.onComplete(
                              ManagerSalaryModel(
                                id: "",
                                nameEmp: titleControl.text,
                                label: listLabel,
                                salaryGain: descControl.text,
                                date: dateFormat.format(myDate),
                                score: rating.toInt(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: themeColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Icon(
                            Icons.done,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 100,
                    height: 100,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      border: Border.all(
                        width: 2,
                        color: Colors.white,
                      ),
                    ),
                    child: const Image(
                      image: AssetImage('images/add_task.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 18),
            child: Column(
              children: [
                TextField(
                  controller: titleControl,
                  cursorColor: themeColor,
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    hintText: "Employee's Name",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: themeColor,
                        width: 3,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.black54,
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
                      "Salary's Total",
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
                  height: 12 * 5,
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    controller: descControl,
                    cursorColor: themeColor,
                    maxLines: 2,
                    style: const TextStyle(fontSize: 16),
                    maxLength: 50,
                    decoration: InputDecoration(
                      hintText: "Salary's total for this Employee...",
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: themeColor,
                          width: 3,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.black54,
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
                            myDate = value;
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
                          dateFormat.format(myDate),
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
                      return index == listLabel.length
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
                                  size: 20,
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AddLabelDialog(
                                        callback: (p0) {
                                          setState(() {
                                            listLabel.add(p0);
                                          });
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            )
                          : index == listLabel.length + 1
                              ? listLabel.isNotEmpty
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
                                            listLabel.clear();
                                          });
                                        },
                                      ),
                                    )
                                  : Container()
                              : SalaryHastag(label: listLabel[index]);
                    },
                    itemCount: listLabel.length + 2,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Row(
                  children: const [
                    Icon(Icons.star_border),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Scores",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                Slider(
                  value: rating,
                  onChanged: (value) {
                    setState(() {
                      rating = value;
                    });
                  },
                  max: 10,
                  min: 1,
                  divisions: 9,
                  label: '$rating',
                  activeColor: themeColor,
                  inactiveColor: themeColor.withAlpha(100),
                  thumbColor: themeColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
