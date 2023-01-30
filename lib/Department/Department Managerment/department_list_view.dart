import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ooad_vubaochau/Department/Department%20Managerment/abstract_depart_list_view.dart';
import 'package:ooad_vubaochau/Department/Department%20Managerment/department_card.dart';
import 'package:ooad_vubaochau/Department/Department%20Managerment/department_list_presenter.dart';
import 'package:ooad_vubaochau/Models/Department_Models/department_info_model.dart';

class DepartmentListScreen extends StatefulWidget {
  const DepartmentListScreen({super.key});

  @override
  State<DepartmentListScreen> createState() => _DepartmentListScreenState();
}

class _DepartmentListScreenState extends State<DepartmentListScreen>
    with AutomaticKeepAliveClientMixin, DepartmentView {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  List<DepartmentModel> listDepartment = [];

  late DepartmentListPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = DepartmentListPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
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
                      return Slidable(
                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {},
                              icon: Icons.edit_outlined,
                              backgroundColor: Colors.blue,
                              label: "Edit",
                              borderRadius: BorderRadius.circular(12),
                            ),
                            SlidableAction(
                              onPressed: (context) {},
                              icon: Icons.edit_outlined,
                              backgroundColor: Colors.red,
                              label: "Remove",
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ],
                        ),
                        child: buildDepartmentItem(listDepartment[index]),
                      );
                    },
                    itemCount: listDepartment.length,
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
                      image: AssetImage('images/position_left.png'),
                      fit: BoxFit.cover,
                      opacity: 0.5,
                    ),
                  ),
                ),
                Container(
                  height: 210,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  child: const Text(
                    'Departments',
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

  Widget buildDepartmentItem(DepartmentModel departmentModel) {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () {
          final slidable = Slidable.of(context)!;
          final isClosed = slidable.actionPaneType.value == ActionPaneType.none;
          if (isClosed) {
            slidable.openStartActionPane();
          } else {
            slidable.close();
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 4, right: 4),
          child: DepartmentCard(
            departmentModel: departmentModel,
          ),
        ),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  getListDepartmnet(List<DepartmentModel> list) {
    if (mounted) {
      setState(() {
        listDepartment = list;
      });
    }
  }

  @override
  onFailed(String message) {
    // TODO: implement onFailed
    throw UnimplementedError();
  }

  @override
  onSuccess(String message) {
    // TODO: implement onSuccess
    throw UnimplementedError();
  }
}
