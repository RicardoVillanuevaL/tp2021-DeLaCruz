import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tp_2021_app/core/sharedPreferences.dart';
import 'package:tp_2021_app/models/dashBoard1Model.dart';
import 'package:tp_2021_app/models/equiposPendientesModel.dart';
import 'package:tp_2021_app/pages/trabajador/eventos/eventoDetailPage.dart';
import 'package:tp_2021_app/pages/trabajador/home/drawer/drawerIconMenu.dart';
import 'package:tp_2021_app/pages/widgets/actionWidgets.dart';
import 'package:tp_2021_app/resources/colors.dart';
import 'package:intl/intl.dart';
import 'package:tp_2021_app/resources/styles.dart';
import 'package:tp_2021_app/services/dashBoardServices.dart';

class HomeWidget extends StatelessWidget {
  final VoidCallback openDrawer;
  HomeWidget({Key? key, required this.openDrawer}) : super(key: key);

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
        body: BodyHomePage(),
      );
}

class BodyHomePage extends StatefulWidget {
  BodyHomePage({Key? key}) : super(key: key);

  @override
  _BodyHomePageState createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
  //FALTA AGREGAR PROGRESS LINEAR INDICATOR Y LOS SERVICOS CON PROVIDER
  List<DashBoard1Model> listEventosHoy = [];
  var listEventosMes = [];
  var listEquiposPendientes = [];
  late bool ddl1, ddl2, ddl3;
  final date = DateTime.now();
  final prefs = PreferenciasUsuario();

  final pruebaFormat = DateFormat('yyyy-MM-dd');
  final format = DateFormat('dd-MM-yyyy');

  @override
  void initState() {
    ddl1 = true;
    ddl2 = true;
    ddl3 = true;
    initializeDateFormatting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mounthName = DateFormat('MMMM', 'es');
    final dayName = DateFormat('dd/MM');
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
                  title: 'Eventos de Hoy - ${dayName.format(date)} ',
                  openSeccion: !ddl1)),
          ddl1
              ? FutureBuilder(
                  future: dashBoardServices.getAllEventosTodayByEmpl(
                      pruebaFormat.format(date), prefs.id),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<DashBoard1Model>> snapshot) {
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
                                              e.nombreProyecto,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            subtitle: Text(
                                              format.format(e.fecha),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            trailing: IconButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      CupertinoPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              EventoDetailPage(
                                                                  idEvento: e
                                                                      .idProyecto)));
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
                  title: 'Eventos de ${mounthName.format(date).toUpperCase()}',
                  openSeccion: !ddl2)),
          ddl2
              ? FutureBuilder(
                  future: dashBoardServices.getAllEventosMonthByEmpl(
                      pruebaFormat.format(date), prefs.id),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<DashBoard1Model>> snapshot) {
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
                                                e.nombreProyecto,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              subtitle: Text(
                                                format.format(e.fecha),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              trailing: IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        CupertinoPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                EventoDetailPage(
                                                                    idEvento: e
                                                                        .idProyecto)));
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
                  title: 'Equipos Pendientes', openSeccion: !ddl3)),
          ddl3
              ? FutureBuilder(
                  future: dashBoardServices.getAllEquiposPendientes(
                      pruebaFormat.format(date),prefs.id),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<EquiposPendiente>> snapshot) {
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
                                              trailing: Text(
                                                'Cant. Equipos ${e.equipo.toString()}',
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
