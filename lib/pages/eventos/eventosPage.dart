import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tp_2021_app/pages/home/drawer/drawerIconMenu.dart';
import 'package:tp_2021_app/pages/widgets/actionWidgets.dart';
import 'package:tp_2021_app/resources/colors.dart';
import 'package:tp_2021_app/resources/styles.dart';

class EventosPage extends StatelessWidget {
  final VoidCallback openDrawer;
  EventosPage({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text('Asistencia y Reportes', style: titleAppBar)),
          leading: DrawerMenuWidget(
              onClicked: openDrawer, icon: FontAwesomeIcons.birthdayCake)),
      body: EventosBody(),
    );
  }
}

class EventosBody extends StatefulWidget {
  EventosBody({Key? key}) : super(key: key);

  @override
  _EventosBodyState createState() => _EventosBodyState();
}

class _EventosBodyState extends State<EventosBody> {
  late int page;

  @override
  void initState() {
    page = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () => setState(() => page = 0),
                      child: TitleSeccionEvento(
                          title: 'Asistencias', selection: page == 0)),
                  InkWell(
                      onTap: () => setState(() => page = 1),
                      child: TitleSeccionEvento(
                          title: 'Reportes', selection: page == 1))
                ]),
          ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: colorBlueLight,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  switch (page) {
                    case 0:
                      return ListTile(
                        title: Text('Asistencia $index'),
                      );
                    case 1:
                      return ListTile(
                        title: Text('Reporte $index'),
                      );
                    default:
                      return ListTile(
                        title: Text('Default $index'),
                      );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
