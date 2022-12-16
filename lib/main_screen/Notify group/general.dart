import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Models/Notification_Models/notifications.dart';

class GeneralNotifyScreen extends StatefulWidget {
  const GeneralNotifyScreen({super.key});

  @override
  State<GeneralNotifyScreen> createState() => _GeneralNotifyScreenState();
}

String demo =
    "Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.";

class _GeneralNotifyScreenState extends State<GeneralNotifyScreen> {
  List<MyNotification> notifies = getListNotifies();
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
    return Card(
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
                Icons.notifications_none,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<MyNotification> getListNotifies() {
  List<MyNotification> myNotifies = [
    MyNotification('Notify 1', demo, '24/12'),
    MyNotification('Notify 2', demo, '12/12'),
    MyNotification('Notify 3', demo, '11/12'),
    MyNotification('Notify 4', demo, '10/11'),
    MyNotification('Notify 5', demo, '09/11'),
    MyNotification('Notify 6', demo, '31/10'),
    MyNotification('Notify 7', demo, '23/10'),
    MyNotification('Notify 8', demo, '22/10'),
    MyNotification('Notify 9', demo, '22/10'),
    MyNotification('Notify 10', demo, '20/10'),
  ];
  return myNotifies;
}
