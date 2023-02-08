import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ooad_vubaochau/Models/Employee_Models/profile_detail.dart';
import 'package:ooad_vubaochau/My%20Profile/abstract_my_profile_view.dart';
import 'package:ooad_vubaochau/My%20Profile/edit_profile_dialog.dart';
import 'package:ooad_vubaochau/My%20Profile/my_profile_presenter.dart';
import 'package:ooad_vubaochau/commons/employee_info.dart';
import 'package:ooad_vubaochau/commons/opaque_image.dart';
import 'package:ooad_vubaochau/commons/profile_info_big_card.dart';
import 'package:ooad_vubaochau/commons/profile_info_card.dart';

class MyProfileDetail extends StatefulWidget {
  const MyProfileDetail({super.key});

  @override
  State<MyProfileDetail> createState() => _MyProfileDetailState();
}

class _MyProfileDetailState extends State<MyProfileDetail>
    with AbstractProfileView {
  ProfileDetail myProfile = ProfileDetail(
    id: "",
    name: "",
    position: "",
    imageURL: "",
    address: "",
    levelPermission: 0,
    taskSuccess: 0,
    taskTotal: 0,
    dayOff: 0,
    email: "",
    phone: "",
    dayWorked: 0,
  );

  late MyProfilePresenter presenter;
  @override
  void initState() {
    super.initState();
    presenter = MyProfilePresenter(this);
  }

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
            "My Profile",
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
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return EditProfileDialog(
                    name: myProfile.name,
                    phone: myProfile.phone,
                    address: myProfile.address,
                    onComplete: (name, phone, address) {
                      presenter.editProfile(myProfile.id, name, phone, address);
                    },
                  );
                },
              );
            },
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
                  Container(
                    height: 300 + MediaQuery.of(context).padding.top,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(myProfile.imageURL),
                        opacity: 0.9,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 300 + MediaQuery.of(context).padding.top,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        OpaqueImage(
                          imageUrl: myProfile.imageURL,
                        ),
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: 16,
                            ),
                            child: MyInfo(
                              name: myProfile.name,
                              posistion: myProfile.position,
                              imageURL: myProfile.imageURL,
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
                          Expanded(
                            flex: 2,
                            child: IntroduceCard(
                              firstText:
                                  "${(myProfile.taskSuccess / myProfile.taskTotal * 100).toStringAsFixed(0)}%",
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
                          Expanded(
                            flex: 2,
                            child: IntroduceCard(
                              firstText: myProfile.levelPermission == 1
                                  ? 'Admin'
                                  : myProfile.levelPermission == 2
                                      ? "Manager"
                                      : myProfile.levelPermission == 3
                                          ? "Staff"
                                          : "None",
                              secondText: 'Level',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      ProfileInfoBigCard(
                        firstText: myProfile.taskTotal.toStringAsFixed(0),
                        secondText: 'Dự án đã làm',
                        icon: Icons.star_purple500_outlined,
                        height: 100,
                      ),
                      ProfileInfoBigCard(
                        firstText: myProfile.dayOff.toString(),
                        secondText: 'Ngày nghỉ',
                        icon: Icons.free_cancellation_rounded,
                        height: 100,
                      ),
                      ProfileInfoBigCard(
                        firstText: 'Email',
                        secondText: myProfile.email,
                        icon: Icons.email,
                        height: 120,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      ProfileInfoBigCard(
                        firstText: myProfile.dayWorked.toString(),
                        secondText: 'Ngày đi làm',
                        icon: Icons.free_cancellation_rounded,
                        height: 100,
                      ),
                      ProfileInfoBigCard(
                        firstText: 'Phone',
                        secondText: myProfile.phone,
                        icon: Icons.phone,
                        height: 100,
                      ),
                      ProfileInfoBigCard(
                        firstText: 'Địa chỉ',
                        secondText: myProfile.address,
                        icon: Icons.location_on,
                        height: 120,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void getProfile(ProfileDetail data) {
    if (mounted) {
      setState(() {
        myProfile = data;
      });
    }
  }

  @override
  void showToastSuccess(String message) => Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.green[300],
        fontSize: 15,
        textColor: Colors.white,
      );
}
