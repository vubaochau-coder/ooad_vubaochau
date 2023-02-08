import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Custom%20widget/user_item_name_avt.dart';
import 'package:ooad_vubaochau/Models/Task_Models/test_emp_model.dart';

class AddMemberDialog extends StatelessWidget {
  final List<MemberInTask> inputData;
  final void Function(MemberInTask) callback;
  const AddMemberDialog(
      {super.key, required this.inputData, required this.callback});

  @override
  Widget build(BuildContext context) {
    Color themeColor = const Color.fromARGB(215, 24, 167, 176);
    final TextEditingController searchControl = TextEditingController();
    return AlertDialog(
      title: const Text('Add Member to Your Task'),
      content: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: searchControl,
                cursorColor: themeColor,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "\"Name\" of Employee",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(80),
                    borderSide: const BorderSide(
                      color: Colors.black54,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(80),
                    borderSide: BorderSide(
                      color: themeColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 160,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        callback(inputData[index]);
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: AvatarNameUser(userInfo: inputData[index]),
                      ),
                    );
                  },
                  itemCount: inputData.length,
                ),
              )
            ],
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'CANCEL',
            style: TextStyle(color: themeColor),
          ),
        ),
      ],
    );
  }
}
