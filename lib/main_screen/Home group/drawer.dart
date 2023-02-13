import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Login/login_view.dart';

class Navigationdrawer extends StatelessWidget {
  final String name;
  final String email;
  final String imgURL;
  const Navigationdrawer(
      {super.key,
      required this.name,
      required this.email,
      required this.imgURL});

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 232,
          child: Stack(
            children: [
              Image.asset(
                'images/logo.png',
                width: double.maxFinite,
                height: double.maxFinite,
                fit: BoxFit.contain,
              ),
              Container(
                color: const Color.fromARGB(215, 24, 167, 176),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: 18 + MediaQuery.of(context).padding.top,
            bottom: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(1),
                child: CircleAvatar(
                  radius: 44,
                  backgroundImage: NetworkImage(imgURL),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                email,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildMenuItems(BuildContext context) {
    Color themeColor = const Color.fromARGB(215, 24, 167, 176);
    return Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.vpn_key_outlined,
            color: themeColor,
          ),
          title: const Text(
            'Change password',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.logout_rounded,
            color: themeColor,
          ),
          title: const Text(
            'Log out',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          onTap: () async {
            await FirebaseAuth.instance.signOut().whenComplete(
                  () => Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }), (route) => false),
                );
          },
        )
      ],
    );
  }
}
