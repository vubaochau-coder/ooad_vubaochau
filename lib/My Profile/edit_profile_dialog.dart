import 'package:flutter/material.dart';

class EditProfileDialog extends StatefulWidget {
  final String name;
  final String phone;
  final String address;
  final void Function(String name, String phone, String address) onComplete;
  const EditProfileDialog({
    super.key,
    required this.name,
    required this.phone,
    required this.address,
    required this.onComplete,
  });

  @override
  State<EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  late TextEditingController nameControl;
  late TextEditingController phoneControl;
  late TextEditingController addressControl;
  late String newName, newPhone, newAddress;
  @override
  void initState() {
    super.initState();
    nameControl = TextEditingController(text: widget.name);
    phoneControl = TextEditingController(text: widget.phone);
    addressControl = TextEditingController(text: widget.address);

    newName = newPhone = newAddress = '';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit your Profile'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 28,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Icon(
                  Icons.person,
                  color: Colors.black54,
                  size: 20,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Name',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            TextField(
              controller: nameControl,
              cursorColor: themeColor,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
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
              height: 18,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Icon(
                  Icons.phone,
                  color: Colors.black54,
                  size: 20,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Phone number',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            TextField(
              controller: phoneControl,
              cursorColor: themeColor,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
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
              height: 18,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Icon(
                  Icons.map,
                  color: Colors.black54,
                  size: 20,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Address',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            TextField(
              controller: addressControl,
              cursorColor: themeColor,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
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
          ],
        ),
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
            if (nameControl.text.trim().isNotEmpty &&
                phoneControl.text.trim().isNotEmpty &&
                addressControl.text.trim().isNotEmpty) {
              if (nameControl.text.trim().compareTo(widget.name) != 0) {
                widget.onComplete(nameControl.text.trim(),
                    phoneControl.text.trim(), addressControl.text.trim());
              } else {
                if (phoneControl.text.trim().compareTo(widget.phone) != 0) {
                  widget.onComplete(nameControl.text.trim(),
                      phoneControl.text.trim(), addressControl.text.trim());
                } else {
                  if (addressControl.text.trim().compareTo(widget.address) !=
                      0) {
                    widget.onComplete(nameControl.text.trim(),
                        phoneControl.text.trim(), addressControl.text.trim());
                  }
                }
              }
              Navigator.pop(context);
            }
          },
          child: Text(
            'DONE',
            style: TextStyle(color: themeColor),
          ),
        ),
      ],
    );
  }
}
