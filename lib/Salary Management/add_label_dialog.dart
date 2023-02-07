import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Models/Salary_Models/test_label_model.dart';

class AddLabelDialog extends StatelessWidget {
  final void Function(TestSalaryLabel) callback;
  const AddLabelDialog({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    int colorSelected = 0;
    TextEditingController labelControl = TextEditingController();
    List<Color> colors = [
      Colors.blue,
      Colors.amber,
      Colors.cyan,
      Colors.pink,
      Colors.deepOrange,
      Colors.deepPurple,
      Colors.red,
      Colors.teal,
      Colors.brown,
      Colors.indigoAccent
    ];
    Color themeColor = const Color.fromARGB(215, 24, 167, 176);
    return AlertDialog(
      titlePadding: const EdgeInsets.only(
        left: 12,
        right: 12,
        top: 12,
        bottom: 24,
      ),
      contentPadding: const EdgeInsets.only(
        left: 12,
        right: 12,
        bottom: 24,
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(Icons.label_outline),
          SizedBox(
            width: 4,
          ),
          Text('Create label'),
        ],
      ),
      content: StatefulBuilder(
        builder: ((context, setState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Title',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                cursorColor: themeColor,
                controller: labelControl,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: themeColor,
                      width: 3,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2,
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
              const Text(
                'Select a color',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 78,
                child: GridView.builder(
                  itemCount: colors.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 4 / 3,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          colorSelected = index;
                        });
                      },
                      child: Container(
                        height: 8,
                        width: 12,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: colorSelected == index
                                ? Colors.blue
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: colors[index],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        }),
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
        TextButton(
          onPressed: () {
            if (labelControl.text != '') {
              TestSalaryLabel newLabel = TestSalaryLabel(
                text: labelControl.text,
                color: colorToString(colors[colorSelected]),
              );
              callback(newLabel);
              labelControl.clear();
            }
            Navigator.pop(context);
          },
          child: Text(
            'CREATE',
            style: TextStyle(color: themeColor),
          ),
        ),
      ],
    );
  }

  String colorToString(Color color) {
    return color.toString().split('(0x')[1].split(')')[0];
  }

  Color stringToColor(String string) {
    return Color(int.parse(string, radix: 16));
  }
}
