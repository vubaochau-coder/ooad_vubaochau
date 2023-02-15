import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/QuanLyChuyenMon/QuanLyTrinhDo/quan_ly_trinh_do_view.dart';
import 'package:ooad_vubaochau/QuanLyChuyenMon/abstract_qlcm_view.dart';
import 'package:ooad_vubaochau/QuanLyChuyenMon/add_chuyen_mon_bottomsheet.dart';
import 'package:ooad_vubaochau/QuanLyChuyenMon/chuyen_mon_item_model.dart';
import 'package:ooad_vubaochau/QuanLyChuyenMon/quan_ly_chuyen_mon_presenter.dart';
import 'package:ooad_vubaochau/loading_ui.dart';

class QuanLyChuyenMon extends StatefulWidget {
  const QuanLyChuyenMon({super.key});

  @override
  State<QuanLyChuyenMon> createState() => _QuanLyChuyenMonState();
}

class _QuanLyChuyenMonState extends State<QuanLyChuyenMon>
    with AbstractQuanLyChuyenMonView {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  List<ChuyenMonItemModel> listData = [];
  bool loading = true;
  late QuanLyChuyenMonPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = QuanLyChuyenMonPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
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
                child: AddChuyenMonBottomSheet(
                  code: listData.length + 1,
                  onComplete: (p0) async {
                    await presenter
                        .createChuyenMon(p0)
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
                'Danh Sách Các Chuyên Môn',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: loading
                  ? const Loading()
                  : ListView.builder(
                      itemCount: listData.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return const QuanLyTrinhDo();
                            }));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            margin: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "ID:  ",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      listData[index].id,
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Text(
                                      'Chuyên môn: ',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      listData[index].name,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Text(
                                      'Số lượng trình độ: ',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '5',
                                      // listData[index].countTrinhDo.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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

  @override
  void getListChuyenMon(List<ChuyenMonItemModel> list) {
    if (mounted) {
      setState(() {
        listData = list;
        loading = false;
      });
    }
  }
}
