import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/QuanLyChuyenMon/chuyen_mon_item_model.dart';

class AddChuyenMonBottomSheet extends StatefulWidget {
  final int code;
  final void Function(ChuyenMonItemModel) onComplete;
  const AddChuyenMonBottomSheet(
      {super.key, required this.code, required this.onComplete});

  @override
  State<AddChuyenMonBottomSheet> createState() =>
      _AddChuyenMonBottomSheetState();
}

class _AddChuyenMonBottomSheetState extends State<AddChuyenMonBottomSheet> {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  TextEditingController nameCtrl = TextEditingController();
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
                'Thêm Chuyên Môn Mới',
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
                  'Mã chuyên môn mới (Auto): ',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  'CM${widget.code.toString().padLeft(3, '0')}',
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
              'Tên chuyên môn mới',
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
              controller: nameCtrl,
              cursorColor: themeColor,
              style: const TextStyle(fontSize: 16),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Tên Chuyên Môn',
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
                    if (nameCtrl.text.trim().isNotEmpty) {
                      widget.onComplete(
                        ChuyenMonItemModel(
                          id: 'CM${widget.code.toString().padLeft(3, '0')}',
                          name: nameCtrl.text.trim(),
                          countTrinhDo: 0,
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
