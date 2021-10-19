import 'package:flutter/material.dart';
import 'package:tp_2021_app/pages/home/drawer/drawerItem.dart';
import 'package:tp_2021_app/pages/home/drawer/listOptionsDrawer.dart';

class DrawerWidget extends StatelessWidget {
  final ValueChanged<DrawerItem> onSelectedItem;
  const DrawerWidget({Key? key, required this.onSelectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [buildDrawerItems(context)],
          ),
        ),
      );

  Widget buildDrawerItems(BuildContext context) => Column(
      children: DrawerItems.all
          .map((e) => ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                leading: Icon(
                  e.icon,
                  color: Colors.white,
                ),
                title: Text(
                  e.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Gothic-Bold'),
                ),
                onTap: () => onSelectedItem(e),
              ))
          .toList());
}
