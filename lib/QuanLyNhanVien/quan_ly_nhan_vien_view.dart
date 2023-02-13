import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/QuanLyNhanVien/abstract_my_task_view.dart';
import 'package:ooad_vubaochau/QuanLyNhanVien/my_task_presenter.dart';
import 'package:ooad_vubaochau/QuanLyNhanVien/nhan_vien_item.dart';
import 'package:ooad_vubaochau/Models/Task_Models/manager_task.dart';

class QuanLyNhanVien extends StatefulWidget {
  const QuanLyNhanVien({super.key});

  @override
  State<QuanLyNhanVien> createState() => _QuanLyNhanVienState();
}

class _QuanLyNhanVienState extends State<QuanLyNhanVien>
    with AbstractMyTaskListView {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  late MyTaskScreenPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = MyTaskScreenPresenter(this);
  }

  List<ManagerTaskModel> taskList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black54,
        title: const Text(
          'Quản Lý Nhân Viên',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: themeColor,
          image: const DecorationImage(
            image: AssetImage('images/position_right.png'),
            fit: BoxFit.cover,
            opacity: 0.4,
          ),
        ),
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top +
                AppBar().preferredSize.height),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(bottom: 20),
              child: const Text(
                'Danh Sách Nhân Viên',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black54,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return ItemNhanVien(
                    task: taskList[index],
                  );
                },
                itemCount: taskList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void getListTask(List<ManagerTaskModel> listData) {
    if (mounted) {
      setState(() {
        taskList = listData;
      });
    }
  }
}
