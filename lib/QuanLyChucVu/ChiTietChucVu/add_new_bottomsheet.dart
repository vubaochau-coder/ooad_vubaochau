import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/QuanLyChucVu/ChiTietChucVu/detail_chuc_vu_item_model.dart';

class CreateChucVuBottomSheet extends StatefulWidget {
  final int code;
  final String nameDonVi;
  final String idDonVi;
  final void Function(DetailInfoChucVu) onComplete;
  final VoidCallback onExit;

  const CreateChucVuBottomSheet({
    super.key,
    required this.onComplete,
    required this.onExit,
    required this.code,
    required this.nameDonVi,
    required this.idDonVi,
  });

  @override
  State<CreateChucVuBottomSheet> createState() =>
      _CreateChucVuBottomSheetState();
}

class _CreateChucVuBottomSheetState extends State<CreateChucVuBottomSheet> {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  TextEditingController nameChucVu = TextEditingController();
  TextEditingController heSoChucVu = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 430,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Thêm Chức Vụ Mới',
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
                  'Đơn vị: ',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  widget.nameDonVi,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  'Mã đơn vị: ',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  widget.idDonVi,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  'Mã chức vụ mới (Auto): ',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  '${widget.idDonVi}CV${widget.code.toString().padLeft(3, '0')}',
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
              'Tên Chức vụ mới',
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
              controller: nameChucVu,
              cursorColor: themeColor,
              style: const TextStyle(fontSize: 16),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Ex: Trưởng phòng, Thư ký,...',
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
              'Hệ số Phụ cấp: ',
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
              controller: heSoChucVu,
              cursorColor: themeColor,
              style: const TextStyle(fontSize: 16),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Ex: 1.2, 1.6,...',
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
                    if (nameChucVu.text.trim().isNotEmpty &&
                        heSoChucVu.text.trim().isNotEmpty) {
                      widget.onComplete(
                        DetailInfoChucVu(
                          idChucVu:
                              '${widget.idDonVi}CV${widget.code.toString().padLeft(3, '0')}',
                          idDonVi: widget.idDonVi,
                          mem: [],
                          nameChucVu: nameChucVu.text.trim(),
                          phuCap: double.parse(heSoChucVu.text.trim()),
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
