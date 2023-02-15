import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ooad_vubaochau/TinhLuong/abstraft_tinh_luong_view.dart';
import 'package:ooad_vubaochau/TinhLuong/tinh_luong_item.dart';
import 'package:ooad_vubaochau/TinhLuong/tinh_luong_item_model.dart';
import 'package:ooad_vubaochau/TinhLuong/tinh_luong_presenter.dart';
import 'package:ooad_vubaochau/loading_ui.dart';

class TinhLuong extends StatefulWidget {
  const TinhLuong({super.key});

  @override
  State<TinhLuong> createState() => _TinhLuongState();
}

class _TinhLuongState extends State<TinhLuong> with AbstractTinhLuongView {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  List<TinhLuongItemModel> listData = [];
  List<TinhLuongItemModel> searchedlist = [];

  DateFormat dateFormat = DateFormat('dd/MM/yyyy');

  bool loading = true;
  late TinhLuongPresenter presenter;
  DateTime time = DateTime.now();

  @override
  void initState() {
    super.initState();
    presenter = TinhLuongPresenter(this, time);
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
          'Tính Lương Nhân Viên',
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
              // const Text(
              //   'Danh Sách Nhân Viên',
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 30,
              //     color: Colors.white,
              //   ),
              // ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 12,
                ),
                const Text(
                  'Ngày nhận lương:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  width: 28,
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.only(
                      top: 4,
                      bottom: 6,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        showDatePicker(
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                primary: themeColor,
                                onPrimary: Colors.white,
                              )),
                              child: child!,
                            );
                          },
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2100),
                        ).then((value) {
                          if (value != null) {
                            setState(() {
                              time = value;
                              loading = true;
                              presenter.getListLuong(time);
                            });
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.grey[300],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dateFormat.format(time),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
              ],
            ),
            Row(
              children: const [
                SizedBox(
                  width: 12,
                ),
                Text(
                  'Lương tối thiểu: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '650,000 vnđ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  width: 12,
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Expanded(
              child: loading
                  ? const Loading()
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return TinhLuongItem(data: searchedlist[index]);
                      },
                      itemCount: searchedlist.length,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void getListPayRoll(List<TinhLuongItemModel> list) {
    if (mounted) {
      setState(() {
        listData = list;
        loading = false;
        searchedlist = list;
      });
    }
  }

  void search(String query) {
    final suggestion = listData.where((element) {
      final empName = element.nameNV.toLowerCase();
      final input = query.toLowerCase();

      return empName.contains(input);
    }).toList();

    setState(() {
      searchedlist = suggestion;
    });
  }
}
