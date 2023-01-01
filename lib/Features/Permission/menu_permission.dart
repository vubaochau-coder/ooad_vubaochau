import 'package:flutter/material.dart';

class MenuPermissionScreen extends StatelessWidget {
  const MenuPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color themeColor = const Color.fromARGB(255, 18, 189, 184);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          SizedBox(
            height: 340,
            child: Stack(
              children: [
                Container(
                  height: 340,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(200, 30),
                    ),
                    image: DecorationImage(
                      image: AssetImage('images/admin_background.jpg'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Container(
                  height: 340,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: themeColor.withOpacity(0.5),
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.elliptical(200, 30),
                    ),
                  ),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 160,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Hi Chau!',
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.white.withAlpha(240),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 6),
                          child: Text(
                            'Admin Dashboard',
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.white.withAlpha(240),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(8),
            splashColor: themeColor,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  Container(
                    width: 280,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage('images/account.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 280,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: themeColor.withOpacity(0.7),
                    ),
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.only(left: 10, bottom: 10),
                    child: const Text(
                      'Account\nManagement',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(8),
            splashColor: themeColor,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  Container(
                    width: 280,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage('images/position.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 280,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: themeColor.withOpacity(0.7),
                    ),
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.only(left: 10, bottom: 10),
                    child: const Text(
                      'Position\nManagement',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
