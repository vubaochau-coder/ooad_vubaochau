import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/QuanLyChucVu/don_vi_chuc_vu_item_model.dart';

class ItemChucVu extends StatelessWidget {
  final ChucVuItemModel data;
  final VoidCallback onTap;
  const ItemChucVu({super.key, required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Color themeColor = const Color.fromARGB(215, 24, 167, 176);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Đơn vị: ',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    data.idDonVi,
                    style: TextStyle(
                      color: Colors.red[400],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                data.nameDonVi,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  const Text(
                    'Số chức vụ trong đơn vị: ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    data.chucVu.length.toString(),
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: onTap,
                    splashColor: themeColor,
                    child: Text(
                      'Chi tiết',
                      style: TextStyle(
                        color: themeColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
