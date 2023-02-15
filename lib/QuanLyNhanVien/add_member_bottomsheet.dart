import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/QuanLyNhanVien/nhan_vien_item_model.dart';

class AddNhanVienBottomSheet extends StatefulWidget {
  final void Function(NhanVienItemModel) onComplete;
  const AddNhanVienBottomSheet({super.key, required this.onComplete});

  @override
  State<AddNhanVienBottomSheet> createState() => _AddNhanVienBottomSheetState();
}

class _AddNhanVienBottomSheetState extends State<AddNhanVienBottomSheet> {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);

  TextEditingController nameNV = TextEditingController();
  TextEditingController ngaySinh = TextEditingController();
  TextEditingController danToc = TextEditingController();
  TextEditingController diachi = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 12, right: 12, top: 18, bottom: 30),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Thêm Nhân Viên Mới',
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
            TextField(
              controller: nameNV,
              cursorColor: themeColor,
              style: const TextStyle(fontSize: 16),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Họ và Tên',
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
              height: 4,
            ),
            TextField(
              controller: ngaySinh,
              cursorColor: themeColor,
              style: const TextStyle(fontSize: 16),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Ngày sinh',
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
          ],
        ),
      ),
    );
  }
}
