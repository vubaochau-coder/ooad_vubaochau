import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/commons/opaque_image.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

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
        const SizedBox(
          height: 232,
          child: OpaqueImage(
            imageUrl: "images/logo.png",
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: 24 + MediaQuery.of(context).padding.top,
            bottom: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 44,
                backgroundImage: AssetImage('images/avatar.jpg'),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Vu Bao Chau',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'baochau@gmail.com',
                style: TextStyle(
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
          onTap: () {},
        )
      ],
    );
  }
}
