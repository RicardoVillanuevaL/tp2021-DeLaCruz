import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerMenuWidget extends StatelessWidget {
  final VoidCallback onClicked;
  final IconData icon;
  const DrawerMenuWidget(
      {Key? key, required this.onClicked, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(
      padding: const EdgeInsets.only(left: 30, top: 20),
      onPressed: onClicked,
      icon: FaIcon(
        icon,
        size: 30,
      ),
      color: Colors.white);
}
