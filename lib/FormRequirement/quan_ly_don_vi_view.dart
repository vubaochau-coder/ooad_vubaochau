import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:ooad_vubaochau/FormRequirement/abstract_requirement_view.dart';
import 'package:ooad_vubaochau/FormRequirement/bottom_sheet.dart';
import 'package:ooad_vubaochau/FormRequirement/don_vi_chi_tiet.dart';
import 'package:ooad_vubaochau/FormRequirement/don_vi_item_model.dart';

import 'package:ooad_vubaochau/FormRequirement/requirement_list_presenter.dart';
import 'package:ooad_vubaochau/Models/Requirement_Models/manager_requirement.dart';

class QuanLyDonVi extends StatefulWidget {
  const QuanLyDonVi({super.key});

  @override
  State<QuanLyDonVi> createState() => _QuanLyDonViState();
}

List<DonViItemModel> donviList = [
  DonViItemModel(
    id: "01",
    name: "khoa công nghệ thông tin",
    diaChi: "Tòa A",
    soDienThoai: "0828671855",
    namThanhLap: "2002",
  ),
  DonViItemModel(
    id: "02",
    name: "khoa nghệ thuật,",
    diaChi: "Tòa A",
    soDienThoai: "0828671855",
    namThanhLap: "2002",
  ),
  DonViItemModel(
    id: "03",
    name: "khoa ngoại ngữ",
    diaChi: "Tòa A",
    soDienThoai: "0828671855",
    namThanhLap: "2002",
  ),
  DonViItemModel(
    id: "04",
    name: "khoa sư phạm khoa học tự nhiên,",
    diaChi: "Tòa A",
    soDienThoai: "0828671855",
    namThanhLap: "2002",
  ),
  DonViItemModel(
    id: "05",
    name: "khoa sư phạm khoa học xã hội,",
    diaChi: "Tòa A",
    soDienThoai: "0828671855",
    namThanhLap: "2002",
  ),
  DonViItemModel(
    id: "06",
    name: "khoa luật",
    diaChi: "Tòa A",
    soDienThoai: "0828671855",
    namThanhLap: "2002",
  ),
  DonViItemModel(
    id: "07",
    name: "trung tâm tin học,",
    diaChi: "Tòa A",
    soDienThoai: "0828671855",
    namThanhLap: "2002",
  ),
  DonViItemModel(
    id: "08",
    name: "trung tâm thông tin và tuyển sinh,",
    diaChi: "Tòa A",
    soDienThoai: "0828671855",
    namThanhLap: "2002",
  ),
  DonViItemModel(
    id: "09",
    name: "trung tâm khai thác và quản trị mạng",
    diaChi: "Tòa A",
    soDienThoai: "0828671855",
    namThanhLap: "2002",
  ),
  DonViItemModel(
    id: "10",
    name: "văn phòng đảng ủy",
    diaChi: "Tòa A",
    soDienThoai: "0828671855",
    namThanhLap: "2002",
  ),
];

class _QuanLyDonViState extends State<QuanLyDonVi>
    with AbstractRequirementView {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  List<ManagerRequiredModel> formList = [];

  final toast = FToast();
  late FormManagerScreenPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = FormManagerScreenPresenter(this);
    toast.init(context);
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
                  presenter.createRequirementForm(title, des);
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
                'Quản Lý Đơn Vị',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: donviList.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) {
                        return const ChiTietDonVi();
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
                                  donviList[index].name,
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
                                  donviList[index].id,
                                  style: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Text(
                              'Địa chỉ: ${donviList[index].diaChi}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Số điện thoại: ${donviList[index].soDienThoai}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  'Năm thành lập: ${donviList[index].namThanhLap}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            )
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

  @override
  void showSuccessToast(String title) => Fluttertoast.showToast(
        msg: title,
        fontSize: 18,
        gravity: ToastGravity.BOTTOM,
      );

  @override
  void updateListView(List<ManagerRequiredModel> task) {
    if (mounted) {
      setState(() {
        formList = task;
      });
    }
  }
}
