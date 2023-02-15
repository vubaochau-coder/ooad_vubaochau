import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/QuanLyChucVu/abstract_quan_ly_chuc_vu_view.dart';
import 'package:ooad_vubaochau/QuanLyChucVu/ChiTietChucVu/chuc_vu_chi_tiet.dart';
import 'package:ooad_vubaochau/QuanLyChucVu/don_vi_qlcv_item.dart';
import 'package:ooad_vubaochau/QuanLyChucVu/don_vi_chuc_vu_item_model.dart';
import 'package:ooad_vubaochau/QuanLyChucVu/quan_ly_chuc_vu_presenter.dart';
import 'package:ooad_vubaochau/loading_ui.dart';

class QuanLyChucVu extends StatefulWidget {
  const QuanLyChucVu({super.key});

  @override
  State<QuanLyChucVu> createState() => _QuanLyChucVuState();
}

class _QuanLyChucVuState extends State<QuanLyChucVu>
    with AbstractQuanLyChucVuView {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  List<ChucVuItemModel> listData = [];
  List<ChucVuItemModel> searchedList = [];
  bool loading = true;
  int currentYear = DateTime.now().year;
  late QuanLyChucVuPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = QuanLyChucVuPresenter(this);
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
          'Quản Lý Chức Vụ',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: themeColor,
          image: const DecorationImage(
            image: AssetImage('images/position_left.png'),
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
                'Danh Sách Đơn Vị',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
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
                        return ItemChucVu(
                          data: searchedList[index],
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return ChucVuChiTiet(data: searchedList[index]);
                            }));
                          },
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
  void getListChucVu(List<ChucVuItemModel> list) {
    if (mounted) {
      setState(() {
        listData = list;
        searchedList = list;
        loading = false;
      });
    }
  }
}
