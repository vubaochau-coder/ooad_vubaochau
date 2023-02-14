import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/QuanLyThanNhan/than_nhan_item_model.dart';

class ItemThanNhan extends StatelessWidget {
  final ThanNhanItemModel data;
  const ItemThanNhan({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.cake,
                  color: Colors.grey[700],
                  size: 15,
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  'Ngày sinh: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
                const Spacer(),
                Text(
                  data.ngaySinh,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.work,
                  color: Colors.grey[700],
                  size: 15,
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  'Nghề nghiệp: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
                const Spacer(),
                Text(
                  data.ngheNghiep,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black87,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Nhân viên: ',
                ),
                Text(
                  data.nameNV,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Quan hệ với nhân viên: ',
                ),
                Text(
                  data.quanHe,
                  style: TextStyle(
                    color: data.quanHe == 'Cha'
                        ? Colors.red[400]
                        : data.quanHe == 'Mẹ'
                            ? Colors.blue[400]
                            : Colors.green[400],
                    fontWeight: FontWeight.w500,
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
