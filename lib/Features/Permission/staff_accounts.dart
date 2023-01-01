import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ooad_vubaochau/Custom%20widget/my_slidable_action.dart';
import 'package:ooad_vubaochau/Models/Account_Models/account_info_model.dart';

import 'account_info.dart';

class StaffAccountListScreen extends StatefulWidget {
  const StaffAccountListScreen({super.key});

  @override
  State<StaffAccountListScreen> createState() => _StaffAccountListScreenState();
}

class _StaffAccountListScreenState extends State<StaffAccountListScreen> {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  List<AccountInfoModel> listAcc = getListAccount();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeColor,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 50),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Slidable(
                    startActionPane: ActionPane(
                      extentRatio: 0.25,
                      motion: const ScrollMotion(),
                      children: [
                        MyCustomSlidableAction(
                          height: 72,
                          width: 72,
                          margin: const EdgeInsets.only(left: 10),
                          backgroundColor: listAcc[index].isActive
                              ? Colors.red
                              : const Color.fromRGBO(129, 199, 132, 1),
                          icon: listAcc[index].isActive
                              ? Icons.disabled_by_default_rounded
                              : Icons.check_box,
                          label: listAcc[index].isActive ? 'Disable' : 'Enable',
                          borderRadius: BorderRadius.circular(36),
                          onPressed: (context) {
                            setState(() {
                              listAcc[index].isActive =
                                  !listAcc[index].isActive;
                            });
                          },
                        ),
                      ],
                    ),
                    child: buildAccList(context, index),
                  ),
                );
              },
              itemCount: listAcc.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAccList(BuildContext context, int index) {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          final slidable = Slidable.of(context)!;
          final isClosed = slidable.actionPaneType.value == ActionPaneType.none;
          if (isClosed) {
            slidable.openStartActionPane();
          } else {
            slidable.close();
          }
        },
        child: AccountItem(
          accInfo: listAcc[index],
        ),
      ),
    );
  }

  static List<AccountInfoModel> getListAccount() {
    List<AccountInfoModel> listAcc = [
      AccountInfoModel(
        'EMP001',
        'Vo Truong Dang Huy',
        'Jun 01',
        '31/12/2022 20:49 PM',
        'vtdhuy@gmail.com',
        'Java developer',
        true,
      ),
      AccountInfoModel(
        'EMP002',
        'Luu Van Luyen',
        'Jun 01',
        '31/12/2022 2:49 AM',
        'lvluyen@gmail.com',
        'C++ developer',
        true,
      ),
      AccountInfoModel(
        'EMP003',
        'Quach Kim Nghia',
        'Jun 01',
        '31/12/2022 9:21 AM',
        'qknghia@gmail.com',
        'C++ developer',
        true,
      ),
      AccountInfoModel(
        'EMP004',
        'Truong Tan Sang',
        'Jun 01',
        '31/12/2022 12:30 AM',
        'ttsang@gmail.com',
        'C# developer',
        false,
      ),
      AccountInfoModel(
        'EMP005',
        'Phung Van Phong',
        'Jun 01',
        '31/12/2022 16:01 PM',
        'pvphong@gmail.com',
        'Flutter developer',
        true,
      ),
      AccountInfoModel(
        'EMP006',
        'Ma Seo Sau',
        'Jun 01',
        '31/12/2022 16:01 PM',
        'mssau@gmail.com',
        'Python developer',
        true,
      ),
      AccountInfoModel(
        'EMP007',
        'Ngo Thanh Nhat',
        'Jun 01',
        '31/12/2022 16:01 PM',
        'ntnhat@gmail.com',
        'Ruby developer',
        true,
      ),
    ];
    return listAcc;
  }
}
