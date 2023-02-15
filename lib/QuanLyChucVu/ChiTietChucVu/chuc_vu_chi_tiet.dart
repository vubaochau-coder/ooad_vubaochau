import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/QuanLyChucVu/ChiTietChucVu/abstract_chuc_vu_chi_tiet.dart';
import 'package:ooad_vubaochau/QuanLyChucVu/ChiTietChucVu/add_new_bottomsheet.dart';
import 'package:ooad_vubaochau/QuanLyChucVu/ChiTietChucVu/chuc_vu_chi_tiet_item.dart';
import 'package:ooad_vubaochau/QuanLyChucVu/ChiTietChucVu/chuc_vu_chi_tiet_presenter.dart';
import 'package:ooad_vubaochau/QuanLyChucVu/ChiTietChucVu/detail_chuc_vu_item_model.dart';
import 'package:ooad_vubaochau/QuanLyChucVu/don_vi_chuc_vu_item_model.dart';

import '../../loading_ui.dart';

class ChucVuChiTiet extends StatefulWidget {
  final ChucVuItemModel data;
  const ChucVuChiTiet({super.key, required this.data});

  @override
  State<ChucVuChiTiet> createState() => _ChucVuChiTietState();
}

class _ChucVuChiTietState extends State<ChucVuChiTiet>
    with AbstractChucVuChiTietView {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  bool loading = true;
  late ChucVuChiTietPresenter presenter;

  List<DetailInfoChucVu> listData = [];

  @override
  void initState() {
    super.initState();
    presenter = ChucVuChiTietPresenter(this, widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
                child: CreateChucVuBottomSheet(
                  nameDonVi: widget.data.nameDonVi,
                  idDonVi: widget.data.idDonVi,
                  code: widget.data.chucVu.length + 1,
                  onComplete: (p0) async {
                    await presenter.addNewChucVu(p0).whenComplete(
                      () {
                        Navigator.pop(context);
                      },
                    );
                  },
                  onExit: () {
                    Navigator.pop(context);
                  },
                ),
              );
            },
          );
        },
        backgroundColor: themeColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
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
              child: Text(
                widget.data.nameDonVi,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
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
                        return ChucVuChiTietItem(
                          data: listData[index],
                          onEdit: (p0) async {
                            await presenter.upDateChucVu(p0).whenComplete(
                                () => Navigator.of(context).pop());
                          },
                        );
                      },
                      itemCount: listData.length,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void getListChucVu(List<DetailInfoChucVu> list) {
    if (mounted) {
      setState(() {
        listData = list;
        loading = false;
      });
    }
  }
}
