import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ooad_vubaochau/Form%20Requirement/abstract_requirement_view.dart';
import 'package:ooad_vubaochau/Form%20Requirement/bottom_sheet.dart';
import 'package:ooad_vubaochau/Form%20Requirement/edit_bottom_sheet.dart';
import 'package:ooad_vubaochau/Form%20Requirement/required_item.dart';
import 'package:ooad_vubaochau/Form%20Requirement/requirement_list_presenter.dart';
import 'package:ooad_vubaochau/Models/Requirement_Models/manager_requirement.dart';

class ManagerRequiredList extends StatefulWidget {
  const ManagerRequiredList({super.key});

  @override
  State<ManagerRequiredList> createState() => _ManagerRequiredListState();
}

class _ManagerRequiredListState extends State<ManagerRequiredList>
    with AbstractRequirementView {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  List<ManagerRequiredModel> formList = [];

  final toast = FToast();
  late FormManagerScreenPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = FormManagerScreenPresenter(this);
    toast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black54,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.sort,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
              ),
            ),
            builder: (BuildContext context) {
              return RequiredBottomSheet(
                onComplete: (p0) async {
                  await presenter.addNewForm(p0).whenComplete(
                        () => Navigator.pop(context),
                      );
                },
                onExit: () {
                  Navigator.pop(context);
                },
              );
            },
          );
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          color: themeColor,
          image: const DecorationImage(
            image: AssetImage('images/demo.jpg'),
            fit: BoxFit.cover,
            opacity: 0.2,
          ),
        ),
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top +
                AppBar().preferredSize.height),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(bottom: 20),
              child: const Text(
                'Form Management',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black54,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final ManagerRequiredModel queries = formList[index];
                  return Slidable(
                    startActionPane: ActionPane(
                      motion: const StretchMotion(),
                      extentRatio: 2 / 3,
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            setState(() {
                              formList.removeAt(index);
                            });
                            showSuccessToast('Form has been deleted');
                          },
                          icon: Icons.delete_outline,
                          label: "Delete",
                          backgroundColor: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(22),
                                  topRight: Radius.circular(22),
                                ),
                              ),
                              builder: (BuildContext context) {
                                return MyFormEditBottomSheet(
                                  onComplete: (p0) {
                                    setState(() {
                                      formList[index] = p0;
                                      Navigator.pop(context);
                                      showSuccessToast('Form has been edited');
                                    });
                                  },
                                  item: formList[index],
                                  onExit: () {
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            );
                          },
                          icon: Icons.edit_outlined,
                          label: "Edit",
                          backgroundColor: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            showSuccessToast('Form Resolving completed');
                          },
                          icon: Icons.done_outline_rounded,
                          label: "Done",
                          backgroundColor: themeColor.withAlpha(200),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ],
                    ),
                    child: buildFormList(queries),
                  );
                },
                itemCount: formList.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildFormList(ManagerRequiredModel queries) {
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
        child: RequiredItem(query: queries),
      ),
    );
  }

  @override
  void showSuccessToast(String title) => Fluttertoast.showToast(
        msg: title,
        fontSize: 18,
        gravity: ToastGravity.BOTTOM,
      );

  @override
  void updateListView(List<ManagerRequiredModel> task) {
    if (mounted) {
      setState(() {
        formList = task;
      });
    }
  }
}
