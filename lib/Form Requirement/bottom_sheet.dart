import 'package:flutter/material.dart';

class RequiredBottomSheet extends StatefulWidget {
  final void Function(String, String) onComplete;
  final VoidCallback onExit;
  const RequiredBottomSheet(
      {super.key, required this.onComplete, required this.onExit});

  @override
  State<RequiredBottomSheet> createState() => _RequiredBottomSheetState();
}

class _RequiredBottomSheetState extends State<RequiredBottomSheet> {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  TextEditingController titleControl = TextEditingController();
  TextEditingController descControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                            if (titleControl.text.trim().isNotEmpty &&
                                descControl.text.trim().isNotEmpty) {
                              widget.onComplete(titleControl.text.trim(),
                                  descControl.text.trim());
                            }
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
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.only(left: 10, right: 10, top: 12),
            child: Column(
              children: [
                const SizedBox(
                  height: 18,
                ),
                TextField(
                  controller: titleControl,
                  cursorColor: themeColor,
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    hintText: "Requirement Form's Title",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
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
                  height: 14,
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
                  height: 12,
                ),
                SizedBox(
                  height: 24 * 14,
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    controller: descControl,
                    cursorColor: themeColor,
                    maxLines: 15,
                    style: const TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      hintText: "Add a more detailed description...",
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
