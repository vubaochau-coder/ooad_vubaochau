import 'package:flutter/material.dart';

import 'package:ooad_vubaochau/Form%20Requirement/abstract_requirement_view.dart';
import 'package:ooad_vubaochau/Form%20Requirement/bottom_sheet.dart';
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

  late FormManagerScreenPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = FormManagerScreenPresenter(this);
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            builder: (BuildContext context) {
              return RequiredBottomSheet(
                onComplete: (String title, String des) {
                  presenter.createRequirementForm(title, des);
                  Navigator.pop(context);
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
                  return RequiredItem(query: queries);
                },
                itemCount: formList.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void updateListView(List<ManagerRequiredModel> task) {
    if (mounted) {
      setState(() {
        formList = task;
      });
    }
  }
}
