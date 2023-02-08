import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Models/Account_Models/account_info_model.dart';

class AccountItem extends StatelessWidget {
  final AccountInfoModel accInfo;
  const AccountItem({super.key, required this.accInfo});

  @override
  Widget build(BuildContext context) {
    Color themeColor = const Color.fromARGB(215, 18, 189, 184);
    double radius = 76;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius / 2),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: radius,
            width: radius,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: themeColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius / 2),
                bottomLeft: Radius.circular(radius / 2),
                bottomRight: Radius.circular(radius / 2),
              ),
            ),
            child: ClipOval(
              child: Image.network(
                accInfo.imgURL,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'images/employee.jpg',
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: radius / 3,
                      width: 220,
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 8,
                      ),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(radius / 6),
                          bottomRight: Radius.circular(radius / 6),
                        ),
                        color: themeColor,
                      ),
                      child: Text(
                        accInfo.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Icon(
                      accInfo.isActive
                          ? Icons.check_circle
                          : Icons.disabled_by_default_rounded,
                      color: accInfo.isActive
                          ? const Color.fromRGBO(129, 199, 132, 1)
                          : Colors.red,
                      size: 19,
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: themeColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(radius / 6),
                      bottomRight: Radius.circular(radius / 2),
                    ),
                  ),
                  child: Container(
                    //height: radius * 2 / 3,
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                      left: 10,
                      //top: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(radius / 4),
                        topRight: Radius.circular(radius / 6),
                        bottomRight: Radius.circular(radius / 2),
                      ),
                    ),
                    child: ListTileTheme(
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      selectedTileColor: Colors.transparent,
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          tilePadding: const EdgeInsets.only(right: 20),
                          childrenPadding: EdgeInsets.zero,
                          collapsedIconColor: themeColor,
                          collapsedTextColor: Colors.black,
                          iconColor: themeColor,
                          textColor: Colors.black,
                          title: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.person_pin,
                                    color: Colors.black,
                                    size: 19,
                                  ),
                                  Icon(
                                    Icons.email,
                                    color: Colors.black,
                                    size: 19,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    accInfo.position,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    accInfo.email,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          children: [
                            Table(
                              columnWidths: const {
                                0: FlexColumnWidth(2),
                                1: FlexColumnWidth(3),
                              },
                              children: [
                                TableRow(
                                  children: [
                                    Text(
                                      'ID: ',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      accInfo.id,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Text(
                                      'Date created: ',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      accInfo.dateCreate,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Text(
                                      'Last login: ',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      accInfo.lastLogin,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Text(
                                      'Status: ',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          accInfo.isActive
                                              ? 'Enable'
                                              : 'Disable',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: accInfo.isActive
                                                ? const Color.fromRGBO(
                                                    129, 199, 132, 1)
                                                : Colors.red,
                                          ),
                                        ),
                                        Icon(
                                          accInfo.isActive
                                              ? Icons.check_circle
                                              : Icons
                                                  .disabled_by_default_rounded,
                                          color: accInfo.isActive
                                              ? const Color.fromRGBO(
                                                  129, 199, 132, 1)
                                              : Colors.red,
                                          size: 14,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
