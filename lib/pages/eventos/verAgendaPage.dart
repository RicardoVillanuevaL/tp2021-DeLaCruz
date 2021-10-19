import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tp_2021_app/pages/home/drawer/drawerIconMenu.dart';
import 'package:tp_2021_app/resources/styles.dart';

class VerAgendaPage extends StatelessWidget {
  final VoidCallback openDrawer;
  VerAgendaPage({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text('Mi Agenda', style: titleAppBar),
          ),
          leading: DrawerMenuWidget(
              onClicked: openDrawer, icon: FontAwesomeIcons.calendar)),
      body: VerAgendaBody(),
    );
  }
}

class VerAgendaBody extends StatefulWidget {
  VerAgendaBody({Key? key}) : super(key: key);

  @override
  _VerAgendaBodyState createState() => _VerAgendaBodyState();
}

class _VerAgendaBodyState extends State<VerAgendaBody> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
