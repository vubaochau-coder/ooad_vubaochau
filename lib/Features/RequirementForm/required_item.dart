import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Models/Requirement_Models/manager_requirement.dart';
import 'package:ooad_vubaochau/commons/rounded_image.dart';

class RequiredItem extends StatelessWidget {
  final ManagerRequiredModel query;
  const RequiredItem({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    Color themeColor = const Color.fromARGB(215, 24, 167, 176);
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 8, top: 12, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    query.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsets.only(right: 4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                      ),
                      const Text(
                        '3 days left',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              // query.subTitle,
              'Nằm nghe sóng vỗ từng lớp xaBọt tràn theo từng làn gió đưaMột vầng trăng sáng với tình yêu chúng taVượt ngàn hải lý cũng không xaBiển rộng đất trời chỉ có taThì dòng ngân hà mình cũng quaBiển không biên giới, như tình anh với emHơn cả những vì sao đêmTrăng nhô lên cao, trăng gác trên đầu núiMây xanh xanh lơ vì đắm say tình mớiĐến đây với em mà ngỡ trong giấc mơMắt em âu sầu là cả một trời thơKhông gian im nghe nhịp đôi tim hẹn ướcMong sao tương lai đường trắng ta cùng bướcXiết tay dắt nhau mình lánh xa thế nhânLánh xa ưu phiền đắng cay trần gianĐời anh sẽ đẹp vì có emNgày dài sẽ làm mình nhớ thêmBiển xanh cát trắng, sóng hòa nhịp ái ânKhông còn những chiều bâng khuâng',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
                color: Colors.black54,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              width: 84,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: themeColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.access_time,
                    color: Colors.white,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    query.date,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
