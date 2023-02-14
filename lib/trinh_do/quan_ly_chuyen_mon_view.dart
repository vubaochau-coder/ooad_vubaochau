import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/trinh_do/chuyen_mon_item_model.dart';
import 'package:ooad_vubaochau/trinh_do/quan_ly_trinh_do_view.dart';
import '../FormRequirement/bottom_sheet.dart';

class QuanLyChuyenMon extends StatefulWidget {
  const QuanLyChuyenMon({super.key});

  @override
  State<QuanLyChuyenMon> createState() => _QuanLyChuyenMonState();
}

List<ChuyenMonItemModel> chuyenMonList = [
  ChuyenMonItemModel(
    id: "CM01",
    name: "Ngoại Ngữ",
  ),
  ChuyenMonItemModel(
    id: "CM02",
    name: "Tin Học",
  ),
  ChuyenMonItemModel(
    id: "CM03",
    name: "Sư Phạm",
  ),
  ChuyenMonItemModel(
    id: "CM04",
    name: "Quản lý",
  ),
];

class _QuanLyChuyenMonState extends State<QuanLyChuyenMon> {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);

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
                'Quản Lý Chuyên Môn',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: chuyenMonList.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) {
                        return const QuanLyTrinhDo();
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
                                    chuyenMonList[index].name,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Text(
                                    "ID:  ",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    chuyenMonList[index].id,
                                    style: const TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ]),
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
}
