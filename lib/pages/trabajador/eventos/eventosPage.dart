import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tp_2021_app/core/sharedPreferences.dart';
import 'package:tp_2021_app/models/notificacionesModel.dart';
import 'package:tp_2021_app/models/reporteModel.dart';
import 'package:tp_2021_app/pages/trabajador/home/drawer/drawerIconMenu.dart';
import 'package:tp_2021_app/pages/widgets/actionWidgets.dart';
import 'package:tp_2021_app/resources/colors.dart';
import 'package:tp_2021_app/resources/styles.dart';
import 'package:tp_2021_app/services/eventServices.dart';

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
              child: Text('Notificaciones y Reportes', style: titleAppBar)),
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
  final prefs = PreferenciasUsuario();
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
                          title: 'Notificaciones', selection: page == 0)),
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
                child: page == 0
                    ? FutureBuilder(
                        future: eventServices.getAllNotificaciones(prefs.id),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<NotificacionModel>> snapshot) {
                          if (snapshot.hasData) {
                            final temp = snapshot.data;
                            if (temp!.length != 0) {
                              return ListView.builder(
                                itemCount: temp.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    decoration: BoxDecoration(border:Border.all(color: colorBlueDark1) ,borderRadius: BorderRadius.circular(20) ),
                                    margin: const EdgeInsetsDirectional.all(8),
                                    child: ListTile(
                                    leading: Icon(
                                      Icons.notifications,
                                      size: 28,
                                      color: Colors.green,
                                    ),
                                    title: Text(temp[index].titulo ?? 'No carga el titulo'),
                                    subtitle: Text(temp[index].cuerpo ?? 'No carga la notificación'),
                                  ));
                                },
                              );
                            } else {
                              return Center(
                                child: Text(
                                  'No tiene Notificaciones',
                                  style: titleLoginStyle,
                                ),
                              );
                            }
                          } else {
                             return Positioned.fill(child: Center(child: CupertinoActivityIndicator()));
                          }
                        },
                      )
                    : FutureBuilder(
                        future: eventServices.getAllReporteID(prefs.id),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<ReporteModel>> snapshot) {
                          if (snapshot.hasData) {
                            final temp = snapshot.data;
                            if (temp!.length != 0) {
                              return ListView.builder(
                                itemCount: temp.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    decoration: BoxDecoration(border:Border.all(color: colorBlueDark1) ,borderRadius: BorderRadius.circular(20) ),
                                    margin: const EdgeInsetsDirectional.all(8),
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.file_copy_outlined,
                                        size: 28,
                                        color: Colors.green,
                                      ),
                                      title: Text(temp[index].nombreProyecto ?? 'No carga el proyecto'),
                                      subtitle: Text(temp[index].reporte?? 'No carga el reporte'),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return Center(
                                child: Text(
                                  'No tiene Reportes',
                                  style: titleLoginStyle,
                                ),
                              );
                            }
                          } else {
                            return Positioned.fill(child: Center(child: CupertinoActivityIndicator()));
                          }
                        },
                      )),
          )
        ],
      ),
    );
  }
}
