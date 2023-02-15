import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/QuanLyChucVu/ChiTietChucVu/detail_chuc_vu_item_model.dart';
import 'package:ooad_vubaochau/QuanLyChucVu/ChiTietChucVu/edit_bottomsheet.dart';

class ChucVuChiTietItem extends StatelessWidget {
  final DetailInfoChucVu data;
  final void Function(DetailInfoChucVu) onEdit;
  const ChucVuChiTietItem(
      {super.key, required this.data, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    Color themeColor = const Color.fromARGB(215, 24, 167, 176);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Mã chức vụ: '),
                Text(
                  data.idChucVu,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(22),
                          topRight: Radius.circular(22),
                        ),
                      ),
                      builder: (BuildContext context) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: EditChucVuBottomSheet(
                            data: data,
                            onComplete: (p0) async {
                              onEdit(p0);
                            },
                          ),
                        );
                      },
                    );
                  },
                  child: const Icon(
                    Icons.edit,
                    color: Colors.grey,
                    size: 20,
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
                  'Chức vụ: ',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  data.nameChucVu,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Mã đơn vị: ',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  data.idDonVi,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Hệ số phụ cấp: ',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  data.phuCap.toStringAsFixed(1),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            ListTileTheme(
              contentPadding: EdgeInsets.zero,
              dense: true,
              selectedTileColor: Colors.transparent,
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  tilePadding: const EdgeInsets.only(right: 20, top: 0),
                  childrenPadding: EdgeInsets.zero,
                  collapsedIconColor: themeColor,
                  collapsedTextColor: Colors.black,
                  iconColor: themeColor,
                  textColor: Colors.black,
                  title: Row(
                    children: [
                      const Text(
                        'Số lượng nhân viên: ',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        data.mem.length.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(bottom: 6),
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data.mem[index]['id']!,
                            ),
                            Text(
                              data.mem[index]['name']!,
                            ),
                          ],
                        );
                      },
                      itemCount: data.mem.length,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
