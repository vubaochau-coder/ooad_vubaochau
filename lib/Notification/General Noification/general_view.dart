import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Models/Notification_Models/notifications.dart';
import 'package:ooad_vubaochau/Notification/General%20Noification/abstract_general_view.dart';
import 'package:ooad_vubaochau/Notification/General%20Noification/general_presenter.dart';
import 'package:ooad_vubaochau/Notification/General%20Noification/noti_item.dart';

class GeneralNotifyScreen extends StatefulWidget {
  const GeneralNotifyScreen({super.key});

  @override
  State<GeneralNotifyScreen> createState() => _GeneralNotifyScreenState();
}

class _GeneralNotifyScreenState extends State<GeneralNotifyScreen>
    with AbStractNotiView, AutomaticKeepAliveClientMixin {
  List<NotificationModel> notifies = [];
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  bool allSelected = true;
  bool unReadSelected = false;

  late GeneralPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = GeneralPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
          child: ListView.builder(
            itemBuilder: (context, index) {
              return buildListView(context, notifies[index]);
            },
            itemCount: notifies.length,
          ),
        ),
      ],
    );
  }

  Widget buildListView(BuildContext context, NotificationModel data) {
    return GestureDetector(
      onTap: () {
        presenter.readNoti(data.id);
      },
      child: NotificationItem(data: data),
    );
  }

  @override
  void getListNoti(List<NotificationModel> notis) {
    if (mounted) {
      setState(() {
        notifies = notis;
      });
    }
  }

  @override
  bool get wantKeepAlive => true;
}
