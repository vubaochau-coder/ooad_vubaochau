import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/QuanLyDoanThe/abstract_qldt_view.dart';
import 'package:ooad_vubaochau/QuanLyDoanThe/add_doan_the_bottomsheet.dart';
import 'package:ooad_vubaochau/QuanLyDoanThe/quan_ly_doan_the_presenter.dart';
import 'package:ooad_vubaochau/loading_ui.dart';
import 'doan_the_item_model.dart';

class QuanLyDoanThe extends StatefulWidget {
  const QuanLyDoanThe({super.key});

  @override
  State<QuanLyDoanThe> createState() => _QuanLyDoanTheState();
}

class _QuanLyDoanTheState extends State<QuanLyDoanThe>
    with AbstractQuanLyDoanTheView {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  List<DoanTheItemModel> listdata = [];
  bool loading = true;

  late QuanLyDoanThePresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = QuanLyDoanThePresenter(this);
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
                child: AddDoanTheBottomSheet(
                  code: listdata.length + 1,
                  onComplete: (p0) async {
                    await presenter
                        .createDoanThe(p0)
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
                'Quản Lý Đoàn Thể',
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
                      itemCount: listdata.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          margin: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 2),
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
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    listdata[index].id,
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                listdata[index].name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              ListTileTheme(
                                contentPadding: EdgeInsets.zero,
                                dense: true,
                                selectedTileColor: Colors.transparent,
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                      dividerColor: Colors.transparent),
                                  child: ExpansionTile(
                                    tilePadding: const EdgeInsets.only(
                                        right: 20, top: 0),
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
                                          listdata[index].mem.length.toString(),
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
                                        padding:
                                            const EdgeInsets.only(bottom: 6),
                                        itemBuilder: (context, indexSecond) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                listdata[index].mem[indexSecond]
                                                    ['id']!,
                                              ),
                                              Text(
                                                listdata[index].mem[indexSecond]
                                                    ['name']!,
                                              ),
                                            ],
                                          );
                                        },
                                        itemCount: listdata[index].mem.length,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
  void getListDoanThe(List<DoanTheItemModel> list) {
    if (mounted) {
      setState(() {
        loading = false;
        listdata = list;
      });
    }
  }
}
