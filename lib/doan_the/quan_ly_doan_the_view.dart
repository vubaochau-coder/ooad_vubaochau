import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/doan_the/doan_the_chi_tiet.dart';
import '../FormRequirement/bottom_sheet.dart';
import 'don_vi_item_model.dart';

class QuanLyDoanThe extends StatefulWidget {
  const QuanLyDoanThe({super.key});

  @override
  State<QuanLyDoanThe> createState() => _QuanLyDoanTheState();
}

List<DoanTheItemModel> doanTheList = [
  DoanTheItemModel(
      id: "DT01",
      name: "Đoàn thanh niên",
      ngayThamGia: "26/03/2002",
      ngayNghi: "28/03/2002"),
  DoanTheItemModel(
      id: "DT02",
      name: "Đảng viên",
      ngayThamGia: "26/03/2002",
      ngayNghi: "28/03/2002"),
  DoanTheItemModel(
      id: "DT03",
      name: "Hội Phụ Nữ",
      ngayThamGia: "26/03/2002",
      ngayNghi: "28/03/2002"),
  DoanTheItemModel(
      id: "DT04",
      name: "Công Đoàn",
      ngayThamGia: "26/03/2002",
      ngayNghi: "28/03/2002"),
  DoanTheItemModel(
      id: "DT05",
      name: "Thanh Tra Nhân Dân",
      ngayThamGia: "26/03/2002",
      ngayNghi: "28/03/2002"),
];

class _QuanLyDoanTheState extends State<QuanLyDoanThe> {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.sort,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            builder: (BuildContext context) {
              return RequiredBottomSheet(
                onComplete: (String title, String des) {
                  Navigator.pop(context);
                },
                onExit: () {
                  Navigator.pop(context);
                },
              );
            },
          );
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          color: themeColor,
          image: const DecorationImage(
            image: AssetImage('images/demo.jpg'),
            fit: BoxFit.cover,
            opacity: 0.2,
          ),
        ),
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top +
                AppBar().preferredSize.height),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(bottom: 20),
              child: const Text(
                'Quản Lý Đoàn Thể',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: doanTheList.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) {
                        return const ChiTietDoanThe();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        width: 360,
                        height: 100,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  doanTheList[index].name,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                const Text(
                                  "ID:  ",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  doanTheList[index].id,
                                  style: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
