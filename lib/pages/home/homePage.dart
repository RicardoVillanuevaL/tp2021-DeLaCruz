import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tp_2021_app/models/dashBoard1Model.dart';
import 'package:tp_2021_app/pages/home/drawer/drawerIconMenu.dart';
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

  final pruebaFormat = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    ddl1 = true;
    ddl2 = true;
    ddl3 = true;
    initializeDateFormatting();
    //prueba();
    super.initState();
  }

  void prueba() async {
    final listPrueba = await dashBoardServices.getAllEventosTodayByEmpl(
        pruebaFormat.format(date), 1);
    print(listPrueba);
    listPrueba.forEach((element) {
      listEventosHoy.add(element);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mounthName = DateFormat('MMMM', 'es');
    final dayName = DateFormat('dd/MM');
    return Container(
        child: Column(
      children: [
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'Bienvenido Ricardo Villanueva este es tu resumen de hoy:',
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
                    pruebaFormat.format(date), 1),
                builder: (BuildContext context,
                    AsyncSnapshot<List<DashBoard1Model>> snapshot) {
                  if (snapshot.hasData) {
                    final list = snapshot.data;
                    return Container(
                      child: list!.length != 0
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: list
                                  .map((e) => ListTile(
                                        title: Text(
                                          e.nombreProyecto,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ))
                                  .toList(),
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
            //onTap: () => setState(() => ddl2 = !ddl2),
            onTap: () {
              prueba();
            },
            child: ItemTitleSeparated(
                title: 'Eventos de ${mounthName.format(date).toUpperCase()}',
                openSeccion: !ddl2)),
        ddl2
            ? Container(
                child: listEventosMes.length != 0
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children:
                            listEventosMes.map((e) => ListTile()).toList(),
                      )
                    : Text('No tienes Eventos este mes',
                        style: messageNotExistList))
            : SizedBox(),
        InkWell(
            onTap: () => setState(() => ddl3 = !ddl3),
            child: ItemTitleSeparated(
                title: 'Equipos Pendientes', openSeccion: !ddl3)),
        ddl3
            ? Container(
                child: listEquiposPendientes.length != 0
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: listEquiposPendientes
                            .map((e) => ListTile())
                            .toList(),
                      )
                    : Text('No tienes Equipos Pendientes por devolver',
                        style: messageNotExistList),
              )
            : SizedBox(),
      ],
    ));
  }
}
