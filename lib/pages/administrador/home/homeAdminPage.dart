import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:tp_2021_app/core/sharedPreferences.dart';
import 'package:tp_2021_app/models/pedidosModel.dart';
import 'package:tp_2021_app/pages/widgets/actionWidgets.dart';
import 'package:tp_2021_app/resources/styles.dart';
import 'package:tp_2021_app/resources/colors.dart';
import 'package:tp_2021_app/pages/trabajador/home/drawer/drawerIconMenu.dart';
import 'package:tp_2021_app/services/eventServices.dart';

class HomeAdminWidget extends StatelessWidget {
  final VoidCallback openDrawer;
  HomeAdminWidget({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: colorBlueDark2,
          elevation: 0,
          leading: DrawerMenuWidget(
            onClicked: openDrawer,
            icon: FontAwesomeIcons.home,
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Dashboard',
              style: titleAppBar,
            ),
          ),
        ),
        body: BodyHomeAdminPage(),
      );
}

class BodyHomeAdminPage extends StatefulWidget {
  BodyHomeAdminPage({Key? key}) : super(key: key);

  @override
  _BodyHomeAdminPageState createState() => _BodyHomeAdminPageState();
}

class _BodyHomeAdminPageState extends State<BodyHomeAdminPage> {
  final prefs = PreferenciasUsuario();
  late bool ddl1, ddl2, ddl3;
  final format = DateFormat('dd-MM-yyyy');
  @override
  void initState() {
     ddl1 = true;
    ddl2 = true;
    ddl3 = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        child: SingleChildScrollView(
      child: Column(
        children: [
                    SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Bienvenido ${prefs.nombre} ${prefs.apellido} este es tu resumen de hoy:',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          InkWell(
              onTap: () => setState(() => ddl1 = !ddl1),
              child: ItemTitleSeparated(
                  title: 'Pedidos Solicitados ',
                  openSeccion: !ddl1)),
          ddl1
              ? FutureBuilder(
                  future: eventServices.listaPedidosEstado(1),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<PedidosModel>> snapshot) {
                    if (snapshot.hasData) {
                      final list = snapshot.data;
                      return Container(
                        height: list!.length != 0 ? size.height / 8 : 50,
                        child: list.length != 0
                            ? SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: list
                                      .map((e) => ListTile(
                                            title: Text(
                                              e.nombre,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            subtitle: Text(
                                              format.format(DateTime.parse(e.fecha)),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            trailing: IconButton(
                                                onPressed: () {
                                                  // Navigator.push(
                                                  //     context,
                                                  //     CupertinoPageRoute(
                                                  //         builder: (BuildContext
                                                  //                 context) =>
                                                  //             EventoDetailPage(
                                                  //                 idEvento: e
                                                  //                     .idProyecto)));
                                                },
                                                icon: FaIcon(
                                                  FontAwesomeIcons.angleRight,
                                                  color: Colors.white,
                                                )),
                                          ))
                                      .toList(),
                                ),
                              )
                            : Text('No tienes Eventos el dia de hoy',
                                style: messageNotExistList),
                      );
                    } else {
                      return LinearProgressIndicator();
                    }
                  },
                )
              : SizedBox(),
          InkWell(
              onTap: () => setState(() => ddl2 = !ddl2),
              child: ItemTitleSeparated(
                  title: 'Pedidos Aceptados',
                  openSeccion: !ddl2)),
          ddl2
              ? FutureBuilder(
                  future: eventServices.listaPedidosEstado(2),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<PedidosModel>> snapshot) {
                    if (snapshot.hasData) {
                      final list = snapshot.data;
                      return Container(
                          height: list!.length != 0 ? size.height / 8 : 50,
                          child: list.length != 0
                              ? SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: list
                                        .map((e) => ListTile(
                                              title: Text(
                                                e.nombre,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              subtitle: Text(
                                                format.format(DateTime.parse(e.fecha)),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              trailing: IconButton(
                                                  onPressed: () {
                                                    // Navigator.push(
                                                    //     context,
                                                    //     CupertinoPageRoute(
                                                    //         builder: (BuildContext
                                                    //                 context) =>
                                                    //             EventoDetailPage(
                                                    //                 idEvento: e
                                                    //                     .idProyecto)));
                                                  },
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.angleRight,
                                                    color: Colors.white,
                                                  )),
                                            ))
                                        .toList(),
                                  ),
                                )
                              : Text('No tienes Eventos este mes',
                                  style: messageNotExistList));
                    } else {
                      return LinearProgressIndicator();
                    }
                  },
                )
              : SizedBox(),
          InkWell(
              onTap: () => setState(() => ddl3 = !ddl3),
              child: ItemTitleSeparated(
                  title: 'Pedidos En Curso', openSeccion: !ddl3)),
          ddl3
              ? FutureBuilder(
                   future: eventServices.listaPedidosEstado(4),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<PedidosModel>> snapshot) {
                    if (snapshot.hasData) {
                      final list = snapshot.data;
                      return Container(
                          height: list!.length != 0 ? size.height / 3 : 50,
                          child: list.length != 0
                              ? SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: list
                                        .map((e) => ListTile(
                                              title: Text(
                                                e.nombre,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              trailing: Text( format.format(DateTime.parse(e.fecha)) ,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                )
                              : Text(
                                  'No tienes Equipos Pendientes por devolver',
                                  style: messageNotExistList));
                    } else {
                      return LinearProgressIndicator();
                    }
                  },
                )
              : SizedBox(),
        ],
      ),
    ));
  }
}
