import 'package:flutter/material.dart';

class ThemNgach extends StatefulWidget {
  const ThemNgach({super.key});

  @override
  State<ThemNgach> createState() => _ThemNgachState();
}

class _ThemNgachState extends State<ThemNgach> {
  Color themeColor = const Color.fromARGB(215, 24, 167, 176);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.white,
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
                      'Quản Lý Ngạch',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ])));
  }
}
