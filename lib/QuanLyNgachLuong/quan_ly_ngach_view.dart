import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/QuanLyNgachLuong/them_ngach_view.dart';
import 'ngach_item_model.dart';

class QuanLyLuong extends StatefulWidget {
  const QuanLyLuong({super.key});

  @override
  State<QuanLyLuong> createState() => _QuanLyLuongState();
}

class _QuanLyLuongState extends State<QuanLyLuong> {
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
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) {
                  return const ThemNgach();
                },
              ));
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
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
                'Quản Lý Ngạch',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: ngachList.length,
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
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ExpansionTile(
                                title: Row(
                                  children: [
                                    Text(
                                      ngachList[index].name,
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
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      ngachList[index].id,
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(215, 24, 167, 176),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                children: [
                                  Row(children: [
                                    Text(
                                      'Niên Hạn: ${ngachList[index].nienHan}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ]),
                                  Row(
                                    children: [
                                      Text(
                                        'Bậc 1: ${ngachList[index].bac1}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        'Bậc 5: ${ngachList[index].bac5}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Bậc 2: ${ngachList[index].bac2}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        'Bậc 6: ${ngachList[index].bac6}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Bậc 3: ${ngachList[index].bac3}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        'Bậc 7: ${ngachList[index].bac7}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(children: [
                                    Text(
                                      'Bậc 7: ${ngachList[index].bac7}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ])
                                ]),
                          )));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
