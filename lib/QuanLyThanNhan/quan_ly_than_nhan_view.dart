import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/QuanLyThanNhan/abstract_quan_ly_than_nhan_view.dart';
import 'package:ooad_vubaochau/QuanLyThanNhan/quan_ly_than_nhan_presenter.dart';
import 'package:ooad_vubaochau/QuanLyThanNhan/than_nhan_item.dart';
import 'package:ooad_vubaochau/QuanLyThanNhan/than_nhan_item_model.dart';
import 'package:ooad_vubaochau/loading_ui.dart';

class QuanLyThanNhan extends StatefulWidget {
  const QuanLyThanNhan({super.key});

  @override
  State<QuanLyThanNhan> createState() => _QuanLyThanNhanState();
}

class _QuanLyThanNhanState extends State<QuanLyThanNhan>
    with AbstractQuanLyThanNhanView {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  List<ThanNhanItemModel> listData = [];
  List<ThanNhanItemModel> searchedList = [];
  TextEditingController filterTextControl = TextEditingController();

  bool loading = true;
  int radioSelect = 0;

  late QuanLyThanNhanPresenter presenter;
  @override
  void initState() {
    super.initState();
    presenter = QuanLyThanNhanPresenter(this);
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
        title: const Text(
          'Quản Lý Thân Nhân',
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
                'Danh Sách Thân Nhân',
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
                controller: filterTextControl,
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
                onChanged: (value) {
                  search(value, radioSelect);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Row(
                children: [
                  Radio(
                    value: 0,
                    groupValue: radioSelect,
                    activeColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        radioSelect = 0;
                      });
                      search(filterTextControl.text, radioSelect);
                    },
                  ),
                  Text(
                    'Tất cả',
                    style: TextStyle(
                      color: radioSelect == 0 ? Colors.white : Colors.black,
                      fontWeight: radioSelect == 0
                          ? FontWeight.w500
                          : FontWeight.normal,
                    ),
                  ),
                  const Spacer(),
                  Radio(
                    value: 1,
                    groupValue: radioSelect,
                    activeColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        radioSelect = 1;
                      });
                      search(filterTextControl.text, radioSelect);
                    },
                  ),
                  Text(
                    'Cha',
                    style: TextStyle(
                      color: radioSelect == 1 ? Colors.white : Colors.black,
                      fontWeight: radioSelect == 1
                          ? FontWeight.w500
                          : FontWeight.normal,
                    ),
                  ),
                  const Spacer(),
                  Radio(
                    value: 2,
                    groupValue: radioSelect,
                    activeColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        radioSelect = 2;
                      });
                      search(filterTextControl.text, radioSelect);
                    },
                  ),
                  Text(
                    'Mẹ',
                    style: TextStyle(
                      color: radioSelect == 2 ? Colors.white : Colors.black,
                      fontWeight: radioSelect == 2
                          ? FontWeight.w500
                          : FontWeight.normal,
                    ),
                  ),
                  const Spacer(),
                  Radio(
                    value: 3,
                    groupValue: radioSelect,
                    activeColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        radioSelect = 3;
                      });
                      search(filterTextControl.text, radioSelect);
                    },
                  ),
                  Text(
                    'Con',
                    style: TextStyle(
                      color: radioSelect == 3 ? Colors.white : Colors.black,
                      fontWeight: radioSelect == 3
                          ? FontWeight.w500
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: loading
                  ? const Loading()
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return ItemThanNhan(
                          data: searchedList[index],
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
  void getListThanNhan(List<ThanNhanItemModel> list) {
    if (mounted) {
      setState(() {
        listData = list;
        searchedList = list;
        loading = false;
      });
    }
  }

  void search(String query, int type) {
    final suggestion = listData.where((element) {
      final empName = element.nameNV.toLowerCase();
      final input = query.toLowerCase();

      return empName.contains(input);
    }).toList();

    if (type == 0) {
      setState(() {
        searchedList = suggestion;
      });
    } else {
      if (type == 1) {
        final suggestion2 = suggestion.where((element) {
          final quanHe = element.quanHe.toLowerCase();
          return quanHe.contains('cha');
        }).toList();

        setState(() {
          searchedList = suggestion2;
        });
      } else {
        if (type == 2) {
          final suggestion2 = suggestion.where((element) {
            final quanHe = element.quanHe.toLowerCase();
            return quanHe.contains('mẹ');
          }).toList();

          setState(() {
            searchedList = suggestion2;
          });
        } else {
          if (type == 3) {
            final suggestion2 = suggestion.where((element) {
              final quanHe = element.quanHe.toLowerCase();
              return quanHe.contains('con cái');
            }).toList();

            setState(() {
              searchedList = suggestion2;
            });
          }
        }
      }
    }
  }
}
