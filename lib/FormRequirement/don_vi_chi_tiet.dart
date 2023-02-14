import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/FormRequirement/quan_ly_don_vi_view.dart';

class ChiTietDonVi extends StatefulWidget {
  const ChiTietDonVi({super.key});

  @override
  State<ChiTietDonVi> createState() => _ChiTietDonViState();
}

class _ChiTietDonViState extends State<ChiTietDonVi> {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        title: const Text(
          'Chi Tiết Đơn Vị',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(bottom: 20),
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
}
