import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/loading_ui.dart';
import 'package:ooad_vubaochau/QuanLyNhanVien/abstract_quan_ly_nhan_vien.dart';
import 'package:ooad_vubaochau/QuanLyNhanVien/nhan_vien_chi_tiet.dart';
import 'package:ooad_vubaochau/QuanLyNhanVien/nhan_vien_item.dart';
import 'package:ooad_vubaochau/QuanLyNhanVien/nhan_vien_item_model.dart';
import 'package:ooad_vubaochau/QuanLyNhanVien/quan_ly_nhan_vien_presenter.dart';

class QuanLyNhanVien extends StatefulWidget {
  const QuanLyNhanVien({super.key});

  @override
  State<QuanLyNhanVien> createState() => _QuanLyNhanVienState();
}

class _QuanLyNhanVienState extends State<QuanLyNhanVien>
    with AbstractQuanLyNhanVienView {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  List<NhanVienItemModel> listData = [];
  List<NhanVienItemModel> searchedList = [];
  bool loading = true;

  late QuanLyNhanVienPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = QuanLyNhanVienPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        title: const Text(
          'Quản Lý Nhân Viên',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: themeColor,
          image: const DecorationImage(
            image: AssetImage('images/position_right.png'),
            fit: BoxFit.cover,
            opacity: 0.3,
          ),
        ),
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top +
                AppBar().preferredSize.height),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(bottom: 30, top: 14),
              child: const Text(
                'Danh Sách Nhân Viên',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
                cursorColor: Colors.black54,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: '"Tên" nhân viên',
                  hintStyle: const TextStyle(
                    color: Colors.black38,
                  ),
                  fillColor: Colors.white24,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 18),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                ),
                onChanged: search,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: loading
                  ? const Loading()
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Future.delayed(
                              const Duration(
                                microseconds: 150,
                              ),
                              () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return ChiTietThongTinNhanVien(
                                        data: searchedList[index],
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                          child: ItemNhanVien(
                            data: searchedList[index],
                          ),
                        );
                      },
                      itemCount: searchedList.length,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void getListNhanVien(List<NhanVienItemModel> list) {
    setState(() {
      listData = list;
      searchedList = list;
      loading = false;
    });
  }

  void search(String query) {
    final suggestion = listData.where((element) {
      final empName = element.name.toLowerCase();
      final input = query.toLowerCase();

      return empName.contains(input);
    }).toList();

    setState(() {
      searchedList = suggestion;
    });
  }
}
