import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/TinhLuong/tinh_luong_item_model.dart';

class TinhLuongItem extends StatelessWidget {
  final TinhLuongItemModel data;
  const TinhLuongItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('Nhân viên: '),
                Text(
                  data.nameNV,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                const Spacer(),
                Text(
                  data.idNV,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Ngày vào làm:',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  data.ngayVaoLam,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Mã đơn vị:',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  data.idDonVi,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Mã chức vụ:',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  data.idChucVu,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Hệ số phụ cấp chức vụ:',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  data.heSoChucVu.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Mã ngạch:',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  data.idNgach,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Hệ số phụ cấp ngạch (Đã tính theo bậc):',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  data.heSoNgach.toStringAsFixed(2),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Hệ số phụ cấp trình độ:',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  data.heSOTrinhDo.toStringAsFixed(2),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
              indent: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tổng hệ số:',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  (data.heSoNgach + data.heSOTrinhDo + data.heSoChucVu)
                      .toStringAsFixed(2),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Hệ số lương chính:',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  ((data.heSoNgach + data.heSOTrinhDo + data.heSoChucVu) *
                          650000)
                      .toStringAsFixed(2),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Thực lãnh:',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  // ignore: prefer_interpolation_to_compose_strings
                  (((data.heSoNgach + data.heSOTrinhDo + data.heSoChucVu) *
                                  650000) -
                              (((data.heSoNgach +
                                          data.heSOTrinhDo +
                                          data.heSoChucVu) *
                                      650000) *
                                  7 /
                                  100))
                          .toStringAsFixed(0) +
                      ' vnđ',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
