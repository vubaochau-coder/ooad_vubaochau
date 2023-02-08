import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ooad_vubaochau/Custom%20widget/my_slidable_action.dart';
import 'package:ooad_vubaochau/Models/Requirement_Models/manager_requirement.dart';
import 'package:ooad_vubaochau/Notification/Private%20Notification/abstrac_request_view.dart';
import 'package:ooad_vubaochau/Notification/Private%20Notification/request_notify_item.dart';
import 'package:ooad_vubaochau/Notification/Private%20Notification/request_presenter.dart';

class RequestNotifyScreen extends StatefulWidget {
  const RequestNotifyScreen({super.key});

  @override
  State<RequestNotifyScreen> createState() => _RequestNotifyScreenState();
}

class _RequestNotifyScreenState extends State<RequestNotifyScreen>
    with RequestNotiView, AutomaticKeepAliveClientMixin {
  List<ManagerRequiredModel> notifies = [];
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  bool allSelected = true;
  bool unReadSelected = false;

  late RequestNotifyPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = RequestNotifyPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Container(
                height: 38,
                width: 60,
                margin: const EdgeInsets.only(
                  left: 8,
                  top: 4,
                  bottom: 4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  border: Border.all(
                    color: allSelected
                        ? themeColor
                        : const Color.fromRGBO(238, 238, 238, 1),
                  ),
                  color: allSelected ? Colors.white : Colors.grey[200],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    setState(() {
                      allSelected = true;
                      unReadSelected = false;
                    });
                  },
                  child: Text(
                    'All',
                    style: TextStyle(
                      color: allSelected ? themeColor : Colors.grey,
                    ),
                  ),
                ),
              ),
              Container(
                height: 38,
                width: 90,
                margin: const EdgeInsets.only(
                  left: 8,
                  top: 4,
                  bottom: 4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  border: Border.all(
                    color: unReadSelected
                        ? themeColor
                        : const Color.fromRGBO(238, 238, 238, 1),
                  ),
                  color: unReadSelected ? Colors.white : Colors.grey[200],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    setState(() {
                      unReadSelected = true;
                      allSelected = false;
                    });
                  },
                  child: Text(
                    'Unread',
                    style: TextStyle(
                      color: unReadSelected ? themeColor : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 12,
          child: notifies.isEmpty
              ? const Center(
                  child: Text('No Request/Response to you.'),
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Slidable(
                      startActionPane: ActionPane(
                        extentRatio: 0.5,
                        motion: const ScrollMotion(),
                        children: [
                          MyCustomSlidableAction(
                            height: 72,
                            width: 72,
                            margin: const EdgeInsets.only(left: 10),
                            backgroundColor: Colors.red,
                            icon: Icons.disabled_by_default_rounded,
                            label: 'Refuse',
                            borderRadius: BorderRadius.circular(36),
                            onPressed: (context) {},
                          ),
                          MyCustomSlidableAction(
                            height: 72,
                            width: 72,
                            margin: const EdgeInsets.only(left: 10),
                            backgroundColor: Colors.blue,
                            icon: Icons.check,
                            label: 'Accept',
                            borderRadius: BorderRadius.circular(36),
                            onPressed: (context) {},
                          ),
                        ],
                      ),
                      child: buildListView(context, index),
                    );
                  },
                  itemCount: notifies.length,
                ),
        ),
      ],
    );
  }

  Widget buildListView(BuildContext context, int index) {
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
        child: RequestNotifyItem(request: notifies[index]),
      ),
    );
  }

  @override
  void showListRequest(List<ManagerRequiredModel> list) {
    if (mounted) {
      setState(() {
        notifies = list;
      });
    }
  }

  @override
  bool get wantKeepAlive => true;
}
