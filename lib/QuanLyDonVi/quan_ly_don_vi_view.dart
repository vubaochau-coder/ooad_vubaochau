import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ooad_vubaochau/Models/Requirement_Models/manager_requirement.dart';

class QuanLyDonVi extends StatefulWidget {
  const QuanLyDonVi({super.key});

  @override
  State<QuanLyDonVi> createState() => _QuanLyDonViState();
}

class _QuanLyDonViState extends State<QuanLyDonVi> {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);
  List<ManagerRequiredModel> formList = [];

  final toast = FToast();

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
        onPressed: () {},
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
                  return Container();
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
