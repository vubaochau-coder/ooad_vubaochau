import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/QuanLyDonVi/abstract_ql_dv_view.dart';
import 'package:ooad_vubaochau/QuanLyDonVi/add_don_vi_bottomsheet.dart';
import 'package:ooad_vubaochau/QuanLyDonVi/don_vi_item_model.dart';
import 'package:ooad_vubaochau/QuanLyDonVi/quan_ly_don_vi_presenter.dart';
import 'package:ooad_vubaochau/loading_ui.dart';

class QuanLyDonVi extends StatefulWidget {
  const QuanLyDonVi({super.key});

  @override
  State<QuanLyDonVi> createState() => _QuanLyDonViState();
}

class _QuanLyDonViState extends State<QuanLyDonVi> with AbstractQLDVView {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  List<DonViItemModel> listData = [];
  bool loading = true;
  late QuanLyDonViPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = QuanLyDonViPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
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
                child: AddDonViBottomSheet(
                  code: listData.length + 1,
                  onComplete: (p0) async {
                    await presenter
                        .createNewDonVi(p0)
                        .whenComplete(() => Navigator.of(context).pop());
                  },
                ),
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
                'Quản Lý Đơn Vị',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: loading
                  ? const Loading()
                  : ListView.builder(
                      itemCount: listData.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          margin: const EdgeInsets.only(
                              top: 4, bottom: 4, left: 2, right: 2),
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
                                    listData[index].name,
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
                                    listData[index].id,
                                    style: const TextStyle(
                                        color: Colors.blue,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Địa chỉ: ${listData[index].diaChi}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Số điện thoại: ${listData[index].soDienThoai}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Năm thành lập: ${listData[index].namThanhLap}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Tổng số nhân viên: ${listData[index].numMember}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
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

  @override
  void getListDonVi(List<DonViItemModel> list) {
    if (mounted) {
      setState(() {
        listData = list;
        loading = false;
      });
    }
  }
}
