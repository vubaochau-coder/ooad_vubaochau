import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ooad_vubaochau/QuanLyNhanVien/nhan_vien_item_model.dart';

class ItemNhanVien extends StatelessWidget {
  final NhanVienItemModel data;
  const ItemNhanVien({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Color themeColor = const Color.fromARGB(215, 24, 167, 176);
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 18,
          right: 18,
          top: 12,
          bottom: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  data.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                const Text(
                  'ID: ',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  data.id,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Ngày sinh: ${data.ngaySinh}',
            ),
            Row(
              children: [
                const Text(
                  'Giới tính: ',
                ),
                Text(
                  data.isMen ? 'Nam' : 'Nữ',
                  style: TextStyle(
                    color: data.isMen ? Colors.blue : Colors.pink,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Đơn vị quản lý: ',
                ),
                Text(
                  'PHÒNG ĐÀO TẠO',
                  style: TextStyle(
                    color: themeColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  DateTime convertStringToDate(String dateString) {
    return DateFormat("MMM dd, yyyy").parse(dateString);
  }

  int daysBetween(DateTime end, DateTime now) {
    return end.difference(now).inDays;
  }

  String countDayString(int value) {
    if (value >= 0) {
      if (value == 1) {
        return "1 day left";
      } else {
        return "$value days left";
      }
    } else {
      if (value == -1) {
        return "1 day ago";
      } else {
        return "${value.abs()} days ago";
      }
    }
  }
}
