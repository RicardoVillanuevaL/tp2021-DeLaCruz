import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tp_2021_app/core/sharedPreferences.dart';
import 'package:tp_2021_app/models/equiposPendientesModel.dart';
import 'package:tp_2021_app/pages/trabajador/equipos/verDetalleEquipos.dart';
import 'package:tp_2021_app/pages/trabajador/home/drawer/drawerIconMenu.dart';
import 'package:tp_2021_app/pages/widgets/actionWidgets.dart';
import 'package:tp_2021_app/resources/styles.dart';
import 'package:tp_2021_app/services/eventServices.dart';

class VerificarEntregaEPage extends StatelessWidget {
  final VoidCallback openDrawer;
  VerificarEntregaEPage({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text('Verificar Equipos', style: titleAppBar),
        ),
        leading: DrawerMenuWidget(
          onClicked: openDrawer,
          icon: FontAwesomeIcons.cameraRetro,
        ),
        actions: [
          IconButton(
              padding: const EdgeInsets.only(top: 20, right: 20),
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.infoCircle))
        ],
      ),
      body: VerificarEntregaEquiposBody(),
    );
  }
}

class VerificarEntregaEquiposBody extends StatefulWidget {
  VerificarEntregaEquiposBody({Key? key}) : super(key: key);

  @override
  _VerificarEntregaEquiposBodyState createState() =>
      _VerificarEntregaEquiposBodyState();
}

class _VerificarEntregaEquiposBodyState
    extends State<VerificarEntregaEquiposBody> {
  final prefs = PreferenciasUsuario();

  @override
  void initState() {
    //addValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TitleDivider(title: 'Equipos Asignados'),
          SizedBox(height: 8),
          Flexible(
            child: Container(
              child: FutureBuilder(
                future: eventServices.getAllEquiposAsignados(prefs.id),
                builder: (BuildContext context,
                    AsyncSnapshot<List<EquiposPendiente>> snapshot) {
                  if (snapshot.hasData) {
                    final temp = snapshot.data;
                    if (temp!.length != 0) {
                      return ListView.builder(
                        itemCount: temp.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (BuildContext context) =>
                                            VerDetalleEquipos(
                                              pendiente: temp[index],
                                            )));
                              },
                              child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              temp[index].nombre,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: fontsGothic,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              temp[index].fecha,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: fontsGothic,
                                                  fontSize: 16),
                                            )
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        VerDetalleEquipos(
                                                          pendiente:
                                                              temp[index],
                                                        )));
                                          },
                                          icon: FaIcon(
                                              FontAwesomeIcons.chevronRight,
                                              color: Colors.white))
                                    ],
                                  ),
                                  margin: const EdgeInsets.all(8),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.white10,
                                      borderRadius:
                                          BorderRadius.circular(12))));
                        },
                      );
                    } else {
                      return Center(
                        child: Text(
                          'No tiene Notificaciones',
                          style: titleAppBar,
                        ),
                      );
                    }
                  } else {
                    return Positioned.fill(
                        child: Center(child: CupertinoActivityIndicator()));
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




// Expanded(
//             child: ListView.builder(
//               itemCount: count,
//               itemBuilder: (BuildContext context, int index) {
//                 return Container(
//                   margin: const EdgeInsets.all(4),
//                   color: colorBlueDark2,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Text(
//                         'EQUIPO $index',
//                         style: TextStyle(
//                             color: Colors.white, fontFamily: fontsGothic),
//                       ),
//                       Container(
//                         width: 120,
//                         child: DropdownButton<String>(
//                           dropdownColor: colorBlueDark1,
//                           items: <String>['Estado', 'Buen estado', 'Mal Estado']
//                               .map<DropdownMenuItem<String>>((e) =>
//                                   DropdownMenuItem<String>(
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(right: 10),
//                                       child: Text(e),
//                                     ),
//                                     value: e,
//                                   ))
//                               .toList(),
//                           value: listaValue[index],
//                           icon: const FaIcon(FontAwesomeIcons.angleDown,
//                               color: Colors.white),
//                           iconSize: 24,
//                           elevation: 16,
//                           style: const TextStyle(color: Colors.white),
//                           underline: Container(height: 2, color: Colors.white),
//                           onChanged: (newValue) {
//                             setState(() {
//                               listaValue[index] = newValue!;
//                             });
//                           },
//                         ),
//                       )
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
