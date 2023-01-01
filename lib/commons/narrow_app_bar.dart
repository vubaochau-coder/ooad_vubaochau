import 'package:flutter/material.dart';

class NarrowAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget leading, trailing;

  const NarrowAppBar(
      {super.key, required this.leading, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          left: 16.0,
          right: 16.0,
          bottom: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            leading,
            const Spacer(),
            trailing,
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
