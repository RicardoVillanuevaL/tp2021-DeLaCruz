import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tp_2021_app/core/dialogs_alert.dart';
import 'package:tp_2021_app/pages/trabajador/equipos/verDetalleEquipos.dart';
import 'package:tp_2021_app/pages/trabajador/home/drawer/drawerIconMenu.dart';
import 'package:tp_2021_app/pages/widgets/actionWidgets.dart';
import 'package:tp_2021_app/resources/styles.dart';

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
              onPressed: () {
                // showDialog(
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => DialogInfo(
                        title: 'INFORMACION',
                        descriptions: 'Hola asdbnashjdbashdhjasdbhjasdbhjasdb',
                        icon: FontAwesomeIcons.cameraRetro)));
                //     context: context,
                //     builder: (context) {
                //       return DialogInfo(
                //           title: 'INFORMACION',
                //           descriptions:
                //               'Hola asdbnashjdbashdhjasdbhjasdbhjasdb',
                //           icon: FontAwesomeIcons.cameraRetro);
                //     });
              },
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
  // List<String> listaValue = [];

  // int count = 6;

  // void addValue() {
  //   for (var i = 0; i < count; i++) {
  //     listaValue.add('Estado');
  //   }
  // }

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
          Expanded(
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                VerDetalleEquipos()));
                  },
                  child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nombre del Proyecto',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: fontsGothic,
                                      fontSize: 16),
                                ),
                                Text(
                                  '18-10-2021',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: fontsGothic,
                                      fontSize: 16),
                                )
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: FaIcon(FontAwesomeIcons.chevronRight,
                                  color: Colors.white))
                        ],
                      ),
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(12))),
                );
              },
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
