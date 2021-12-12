

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tp_2021_app/pages/administrador/home/drawer/drawerIconMenu.dart';
import 'package:tp_2021_app/resources/styles.dart';

class VerIncidenciasPage extends StatelessWidget {
  final VoidCallback openDrawer;
  VerIncidenciasPage({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text('Reportes de Incidencias', style: titleAppBar),
          ),
          leading: DrawerMenuWidget(
              onClicked: openDrawer, icon: FontAwesomeIcons.calendar)),
      body: VerIncidenciasBody(),
    );
  }
}

class VerIncidenciasBody extends StatefulWidget {
  const VerIncidenciasBody({ Key? key }) : super(key: key);

  @override
  _VerIncidenciasBodyState createState() => _VerIncidenciasBodyState();
}

class _VerIncidenciasBodyState extends State<VerIncidenciasBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}