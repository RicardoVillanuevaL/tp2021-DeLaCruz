import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tp_2021_app/pages/administrador/home/drawer/drawerIconMenu.dart';
import 'package:tp_2021_app/resources/styles.dart';

class VerProyectosPage extends StatelessWidget {
  final VoidCallback openDrawer;
  VerProyectosPage({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text('Ver Proyectos', style: titleAppBar),
          ),
          leading: DrawerMenuWidget(
              onClicked: openDrawer, icon: FontAwesomeIcons.calendar)),
      body: VerProyectosBody(),
    );
  }
}

class VerProyectosBody extends StatefulWidget {
  const VerProyectosBody({Key? key}) : super(key: key);

  @override
  _VerProyectosBodyState createState() => _VerProyectosBodyState();
}

class _VerProyectosBodyState extends State<VerProyectosBody> {
  @override
  void initState() {
    print('lib-pages-administrador-proyectos-verProyectosPage.dart');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
