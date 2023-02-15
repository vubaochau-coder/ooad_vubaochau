import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/QuanLyDonVi/don_vi_item_model.dart';

class AddDonViBottomSheet extends StatefulWidget {
  final int code;
  final void Function(DonViItemModel) onComplete;
  const AddDonViBottomSheet(
      {super.key, required this.code, required this.onComplete});

  @override
  State<AddDonViBottomSheet> createState() => _AddDonViBottomSheetState();
}

class _AddDonViBottomSheetState extends State<AddDonViBottomSheet> {
  TextEditingController nameDV = TextEditingController();
  TextEditingController soDT = TextEditingController();
  TextEditingController diaChi = TextEditingController();
  TextEditingController namTL = TextEditingController();

  Color themeColor = const Color.fromARGB(215, 24, 167, 176);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 530,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Thêm Đơn Vị Mới',
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
                  'Mã đơn vị mới (Auto): ',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  'DV${widget.code.toString().padLeft(3, '0')}',
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
              controller: nameDV,
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
              height: 8,
            ),
            Text(
              'Địa chỉ đơn vị mới',
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
              controller: diaChi,
              cursorColor: themeColor,
              style: const TextStyle(fontSize: 16),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Địa chỉ',
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
              height: 8,
            ),
            Text(
              'Năm thành lập',
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
              controller: namTL,
              cursorColor: themeColor,
              style: const TextStyle(fontSize: 16),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Năm thành lập',
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
              height: 8,
            ),
            Text(
              'Số điện thoại',
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
              controller: soDT,
              cursorColor: themeColor,
              style: const TextStyle(fontSize: 16),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Số điện thoại',
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
                    if (nameDV.text.trim().isNotEmpty &&
                        diaChi.text.trim().isNotEmpty &&
                        soDT.text.trim().isNotEmpty &&
                        namTL.text.trim().isNotEmpty) {
                      widget.onComplete(DonViItemModel(
                        id: 'DV${widget.code.toString().padLeft(3, '0')}',
                        name: nameDV.text.trim(),
                        diaChi: diaChi.text.trim(),
                        soDienThoai: soDT.text.trim(),
                        namThanhLap: namTL.text.trim(),
                        numMember: 0,
                      ));
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
