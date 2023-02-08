import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Models/Requirement_Models/manager_requirement.dart';

class RequestNotifyItem extends StatelessWidget {
  final ManagerRequiredModel request;
  const RequestNotifyItem({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    Color themeColor = const Color.fromARGB(215, 24, 167, 176);
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
                Icons.question_answer,
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
                        request.title,
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
                        request.date,
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
                    request.subTitle,
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
                      Expanded(
                        flex: 5,
                        child: Text(
                          request.nameWriter,
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
    );
  }
}
