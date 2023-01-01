import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ooad_vubaochau/Custom%20widget/my_slidable_action.dart';
import 'package:ooad_vubaochau/Features/Permission/account_info.dart';
import 'package:ooad_vubaochau/Models/Account_Models/account_info_model.dart';

class ManagerAccountListScreen extends StatefulWidget {
  const ManagerAccountListScreen({super.key});

  @override
  State<ManagerAccountListScreen> createState() =>
      _ManagerAccountListScreenState();
}

class _ManagerAccountListScreenState extends State<ManagerAccountListScreen> {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  List<AccountInfoModel> listAcc = getListAccount();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: themeColor,
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
        'MGR001',
        'Vu Bao Chau',
        'Jun 01',
        'Dec 31 20:49',
        'vbchau@gmail.com',
        'Personnel manager',
        true,
      ),
      AccountInfoModel(
        'MGR002',
        'Nguyen Truong Dinh Du',
        'Jun 01',
        'Dec 31 2:49',
        'ntddu@gmail.com',
        'Finance Manager',
        true,
      ),
      AccountInfoModel(
        'MGR003',
        'Pham Minh Nhat',
        'Jun 01',
        'Dec 31 9:21',
        'pmnhat@gmail.com',
        'Marketing manager',
        true,
      ),
      AccountInfoModel(
        'MGR004',
        'Nguyen Nhat Cuong',
        'Jun 01',
        'Dec 31 12:30',
        'nncuong@gmail.com',
        'Production manager',
        false,
      ),
      AccountInfoModel(
        'MGR005',
        'Tran Thi Hoai Thu',
        'Jun 01',
        'Dec 31 16:01',
        'tththu@gmail.com',
        'Accounting manager',
        true,
      ),
      AccountInfoModel(
        'MGR006',
        'Tran Thi Hoai Thu',
        'Jun 01',
        'Dec 31 16:01',
        'tththu@gmail.com',
        'Accounting manager',
        true,
      ),
    ];
    return listAcc;
  }
}
