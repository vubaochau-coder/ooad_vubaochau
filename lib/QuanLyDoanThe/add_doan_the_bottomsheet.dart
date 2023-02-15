import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/QuanLyDoanThe/doan_the_item_model.dart';

class AddDoanTheBottomSheet extends StatefulWidget {
  final int code;
  final void Function(DoanTheItemModel) onComplete;
  const AddDoanTheBottomSheet(
      {super.key, required this.code, required this.onComplete});

  @override
  State<AddDoanTheBottomSheet> createState() => _AddDoanTheBottomSheetState();
}

class _AddDoanTheBottomSheetState extends State<AddDoanTheBottomSheet> {
  TextEditingController nameControl = TextEditingController();
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Thêm Đoàn Thể Mới',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Row(
              children: [
                Text(
                  'Mã đoàn thể mới (Auto): ',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  'DT${widget.code.toString().padLeft(3, '0')}',
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Tên đơn vị mới',
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TextField(
              controller: nameControl,
              cursorColor: themeColor,
              style: const TextStyle(fontSize: 16),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Tên Đơn Vị',
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.grey,
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
              height: 40,
            ),
            Center(
              child: SizedBox(
                height: 42,
                width: 260,
                child: ElevatedButton(
                  onPressed: () {
                    if (nameControl.text.trim().isNotEmpty) {
                      widget.onComplete(
                        DoanTheItemModel(
                          id: 'DT${widget.code.toString().padLeft(3, '0')}',
                          name: nameControl.text.trim(),
                          mem: [],
                          numMem: 0,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  child: const Text(
                    'Hoàn tất',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
