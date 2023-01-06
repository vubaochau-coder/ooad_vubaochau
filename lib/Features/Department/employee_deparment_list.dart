import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Features/Department/emp_department_card.dart';

class DepartmentEmpListScreen extends StatefulWidget {
  const DepartmentEmpListScreen({super.key});

  @override
  State<DepartmentEmpListScreen> createState() =>
      _DepartmentEmpListScreenState();
}

class _DepartmentEmpListScreenState extends State<DepartmentEmpListScreen>
    with AutomaticKeepAliveClientMixin {
  Color themeColor = const Color.fromARGB(255, 18, 189, 184);
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
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
                    return buildEmpDepartment();
                  },
                  itemCount: 12,
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
                    image: AssetImage('images/position_right.png'),
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
                padding: const EdgeInsets.only(left: 22, right: 22, top: 18),
                child: TextField(
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                  cursorColor: Colors.black54,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    hintText: '"Name" of employee',
                    hintStyle: const TextStyle(
                      color: Colors.black38,
                    ),
                    fillColor: Colors.white24,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 18),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildEmpDepartment() {
    return const EmpDepartmentCard();
  }

  @override
  bool get wantKeepAlive => true;
}
