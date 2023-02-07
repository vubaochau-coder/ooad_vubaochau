import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ooad_vubaochau/Custom%20widget/my_slidable_action.dart';
import 'package:ooad_vubaochau/Permission/Manager%20Account/abstract_manager_acc_view.dart';
import 'package:ooad_vubaochau/Permission/Manager%20Account/manager_acc_presenter.dart';
import 'package:ooad_vubaochau/Permission/account_info.dart';
import 'package:ooad_vubaochau/Models/Account_Models/account_info_model.dart';

class ManagerAccountListScreen extends StatefulWidget {
  const ManagerAccountListScreen({super.key});

  @override
  State<ManagerAccountListScreen> createState() =>
      _ManagerAccountListScreenState();
}

class _ManagerAccountListScreenState extends State<ManagerAccountListScreen>
    with AutomaticKeepAliveClientMixin, AbstractMngAccView {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  late MngAccPresenter presenter;
  List<AccountInfoModel> listAcc = [];

  @override
  void initState() {
    super.initState();
    presenter = MngAccPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: 'fab_manager_acc',
        onPressed: () {},
        backgroundColor: themeColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(
                  height: 180,
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
                                label: listAcc[index].isActive
                                    ? 'Disable'
                                    : 'Enable',
                                borderRadius: BorderRadius.circular(36),
                                onPressed: (context) {
                                  if (listAcc[index].isActive) {
                                    presenter.disableAccount(listAcc[index].id);
                                  } else {
                                    presenter.enableAccount(listAcc[index].id);
                                  }
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
          ),
          SizedBox(
            height: 234,
            child: Stack(
              children: [
                Container(
                  height: 210,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(200, 30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        blurRadius: 14,
                        blurStyle: BlurStyle.normal,
                        spreadRadius: -14,
                        offset: Offset(7, 12),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 210,
                  decoration: BoxDecoration(
                    color: themeColor,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.elliptical(200, 30),
                    ),
                    image: const DecorationImage(
                      image: AssetImage('images/account.jpg'),
                      fit: BoxFit.cover,
                      opacity: 0.1,
                    ),
                  ),
                ),
                Container(
                  height: 210,
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  child: const Text(
                    'Accounts',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
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

  @override
  bool get wantKeepAlive => true;

  @override
  void showListMngAcc(List<AccountInfoModel> list) {
    if (mounted) {
      setState(() {
        listAcc = list;
      });
    }
  }

  @override
  void showFailedToast(String message) => Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red[300],
        gravity: ToastGravity.BOTTOM,
        fontSize: 15,
        toastLength: Toast.LENGTH_LONG,
      );

  @override
  void showSuccessToast(String message) => Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.green[300],
        gravity: ToastGravity.BOTTOM,
        fontSize: 15,
        toastLength: Toast.LENGTH_LONG,
      );
}
