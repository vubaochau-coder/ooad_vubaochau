import 'package:flutter/material.dart';

import 'package:ooad_vubaochau/QuanLyNhanVien/nhan_vien_item_model.dart';
import 'package:ooad_vubaochau/commons/employee_info.dart';
import 'package:ooad_vubaochau/commons/opaque_image.dart';

import 'package:ooad_vubaochau/commons/profile_info_card.dart';

class ChiTietThongTinNhanVien extends StatefulWidget {
  final NhanVienItemModel data;
  const ChiTietThongTinNhanVien({super.key, required this.data});

  @override
  State<ChiTietThongTinNhanVien> createState() =>
      _ChiTietThongTinNhanVienState();
}

class _ChiTietThongTinNhanVienState extends State<ChiTietThongTinNhanVien> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Thông tin nhân viên",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 334 + MediaQuery.of(context).padding.top,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  SizedBox(
                    height: 300 + MediaQuery.of(context).padding.top,
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(
                    height: 300 + MediaQuery.of(context).padding.top,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        OpaqueImage(
                          imageUrl: widget.data.imgURL,
                        ),
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: 16,
                            ),
                            child: MyInfo(
                              name: widget.data.name,
                              posistion: 'Position',
                              imageURL: widget.data.imgURL,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 0,
                    child: SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Expanded(
                            flex: 2,
                            child: IntroduceCard(
                              firstText: "90%",
                              secondText: 'Progress',
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Card(
                              child: Image.asset(
                                "images/pulse_icon.png",
                                color: const Color.fromARGB(255, 26, 218, 224),
                                width: 25,
                                height: 40,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Expanded(
                            flex: 2,
                            child: IntroduceCard(
                              firstText: 'Nhân viên',
                              secondText: 'Chức vụ',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Text(
                'Thông tin cơ bản',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(
                left: 12,
                right: 12,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Mã nhân viên (ID): ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          widget.data.id,
                          style: TextStyle(
                            color: Colors.red[400],
                            fontWeight: FontWeight.w500,
                            fontSize: 14.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'CNMD/CCCD: ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          widget.data.soCMND,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.5,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black87,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Ngày sinh: ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          widget.data.ngaySinh,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Dân tộc: ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          widget.data.danToc,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Giới tính: ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          widget.data.isMen ? 'Nam' : 'Nữ',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.5,
                          ),
                        ),
                        Icon(
                          widget.data.isMen ? Icons.male : Icons.female,
                          color: widget.data.isMen ? Colors.blue : Colors.pink,
                          size: 18,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Địa chỉ: ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          widget.data.diaChi,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.5,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black87,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Ngày vào làm: ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          widget.data.ngayVaoLam,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Ngày nghỉ hưu: ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          widget.data.ngayNghiLam,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Text(
                'Quá trình làm việc',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(
                left: 12,
                right: 12,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                child: SizedBox(
                  height: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
