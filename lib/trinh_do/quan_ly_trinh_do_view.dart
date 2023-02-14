import 'package:flutter/material.dart';

import 'package:ooad_vubaochau/trinh_do/trinh_do_item_model.dart';
import '../FormRequirement/bottom_sheet.dart';

class QuanLyTrinhDo extends StatefulWidget {
  const QuanLyTrinhDo({super.key});

  @override
  State<QuanLyTrinhDo> createState() => _QuanLyTrinhDoState();
}

List<TrinhDoItemModel> trinhDoList = [
  TrinhDoItemModel(
    id: "TD01",
    name: "Sơ Cấp",
    phuCapTrinhDo: "5 tr",
  ),
  TrinhDoItemModel(
    id: "TD02",
    name: "Trung Cấp",
    phuCapTrinhDo: "5 tr",
  ),
  TrinhDoItemModel(
    id: "TD03",
    name: "Cao Đẳng",
    phuCapTrinhDo: "5 tr",
  ),
  TrinhDoItemModel(
    id: "TD04",
    name: "Đại học",
    phuCapTrinhDo: "5 tr",
  ),
  TrinhDoItemModel(
    id: "TD05",
    name: "Thạc sĩ, Tiến sĩ",
    phuCapTrinhDo: "5 tr",
  ),
];

class _QuanLyTrinhDoState extends State<QuanLyTrinhDo> {
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
                'Quản Lý Trình Độ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: trinhDoList.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) {
                        return Container();
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
                                    trinhDoList[index].name,
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
                                    trinhDoList[index].id,
                                    style: const TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Phụ Cấp Trình Độ: ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    trinhDoList[index].phuCapTrinhDo,
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
