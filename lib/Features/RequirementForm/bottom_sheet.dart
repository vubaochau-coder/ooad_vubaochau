import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Models/Requirement_Models/label.dart';
import 'package:ooad_vubaochau/Models/Requirement_Models/manager_requirement.dart';

class RequiredBottomSheet extends StatefulWidget {
  final void Function(ManagerRequiredModel) callback;
  const RequiredBottomSheet({super.key, required this.callback});

  @override
  State<RequiredBottomSheet> createState() => _RequiredBottomSheetState();
}

class _RequiredBottomSheetState extends State<RequiredBottomSheet> {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  List<MyLabelModel> listLabel = [];
  List<String> listMembers = [];
  TextEditingController titleControl = TextEditingController();
  TextEditingController descControl = TextEditingController();
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
                "ADD NEW REQUIREMENT FORM",
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
                    ManagerRequiredModel(
                        titleControl.text, descControl.text, 'Dec 30', 3),
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
                        fontWeight: FontWeight.w500,
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
              hintText: "Requirement form title",
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
              controller: descControl,
              cursorColor: themeColor,
              maxLines: 5,
              style: const TextStyle(fontSize: 16),
              maxLength: 150,
              decoration: InputDecoration(
                hintText: "More detailed description...",
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.grey[300],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Dec 30',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                  ),
                ],
              ),
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
            height: 102,
            margin: const EdgeInsets.only(top: 4, bottom: 6),
            child: GridView.builder(
              itemCount: listMembers.length + 1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                return index == listMembers.length
                    ? Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[350],
                        ),
                        margin: const EdgeInsets.only(left: 4, right: 4),
                        alignment: Alignment.center,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.add_rounded),
                          onPressed: () {
                            setState(() {
                              listMembers.add("New employee");
                            });
                          },
                        ),
                      )
                    : Container(
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
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
