import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Models/Notification_Models/request_notification.dart';
import 'package:ooad_vubaochau/Notification/request_detail.dart';

class RequestNotifyScreen extends StatefulWidget {
  const RequestNotifyScreen({super.key});

  @override
  State<RequestNotifyScreen> createState() => _RequestNotifyScreenState();
}

String demo =
    "Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.";

class _RequestNotifyScreenState extends State<RequestNotifyScreen> {
  List<RequestNotificationModel> notifies = [];
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  bool allSelected = true;
  bool unReadSelected = false;

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
              const Expanded(
                child: SizedBox(),
              ),
              Container(
                margin: const EdgeInsets.only(right: 8),
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: themeColor,
                ),
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.filter_list,
                    color: Colors.white,
                    size: 22,
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
              return buildListView(context, index);
            },
            itemCount: notifies.length,
          ),
        ),
      ],
    );
  }

  Widget buildListView(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return const RequestDetailScreen();
            },
          ),
        );
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.only(
            left: 4,
            right: 4,
            top: 6,
            bottom: 6,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Icon(
                  notifies[index].isSalaryRequest
                      ? Icons.monetization_on_outlined
                      : Icons.access_alarm,
                  color: themeColor,
                  size: 42,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          notifies[index].title,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black54,
                          ),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Text(
                          notifies[index].date,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color.fromRGBO(189, 189, 189, 1),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      notifies[index].details,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text(
                            'From: ',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          flex: 5,
                          child: Text(
                            notifies[index].idUserRequest,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
