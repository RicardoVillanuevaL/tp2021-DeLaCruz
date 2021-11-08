import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tp_2021_app/core/loadUtils.dart';
import 'package:tp_2021_app/models/proyectoInfoModel.dart';
import 'package:tp_2021_app/pages/widgets/viewWidgets.dart';
import 'package:tp_2021_app/resources/colors.dart';
import 'package:tp_2021_app/services/eventServices.dart';
import 'dart:io' show Platform;

import 'package:url_launcher/url_launcher.dart';

class EventoDetailPage extends StatefulWidget {
  final int idEvento;
  const EventoDetailPage({Key? key, required this.idEvento}) : super(key: key);

  @override
  _EventoDetailPageState createState() => _EventoDetailPageState();
}

class _EventoDetailPageState extends State<EventoDetailPage> {
  late int idProyecto;
  late String urlLauncher;
  final location = LatLng(-12.0337104, -77.0081133);

  @override
  void initState() {
    idProyecto = this.widget.idEvento;
    loadUtils.load();
    super.initState();
  }

  void openRoute() async{
      if (Platform.isAndroid) {
        urlLauncher = "comgooglemaps://?center=-12.0337104,-77.0081133";
      } else if(Platform.isIOS) {
        urlLauncher = "https://maps.apple.com/?q=-12.0337104,-77.0081133";
      }
      if (await canLaunch(urlLauncher)){
        await launch(urlLauncher);
      }else{
        print('no se puede esta shit');
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Evento'),
        backgroundColor: colorBlueDark2,
      ),
      body: FutureBuilder(
        future: eventServices.getInfoProyecto(idProyecto),
        builder: (BuildContext context, AsyncSnapshot<ProyectoInfo> snapshot) {
          if (snapshot.hasData) {
            final proyecto = snapshot.data!;
            return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ItemDetailProyecto(
                        title: 'Nombre del Evento',
                        text: proyecto.nombre,
                        icon: FontAwesomeIcons.birthdayCake,
                      ),
                      ItemDetailProyecto(
                        title: 'Fecha del Evento',
                        text: proyecto.fecha.toString(),
                        icon: FontAwesomeIcons.calendarAlt,
                      ),
                      ItemDetailProyecto(
                        title: 'Hora del Evento',
                        text: proyecto.hora,
                        icon: FontAwesomeIcons.clock,
                      ),
                      ItemDetailProyecto(
                        title: 'Cliente',
                        text: proyecto.cliente,
                        icon: FontAwesomeIcons.userAlt,
                      ),
                      ItemDetailProyecto(
                        title: 'Telefono',
                        text: proyecto.celular,
                        icon: FontAwesomeIcons.phone,
                      ),
                      ItemDetailProyecto(
                        title: 'Direccion del Evento',
                        text: proyecto.direccion,
                        icon: FontAwesomeIcons.mapMarkerAlt,
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 200,
                        child: GoogleMap(
                          initialCameraPosition:
                              CameraPosition(target: location, zoom: 16),
                          myLocationButtonEnabled: false,
                          markers: <Marker>{
                            Marker(
                                markerId: MarkerId('Valor de Prueba'),
                                position: location,
                                icon: loadUtils.pinIcon)
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                              color: colorBlueDark2,
                              borderRadius: BorderRadius.circular(20)),
                          child: TextButton.icon(
                            onPressed: () {
                              openRoute();
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.locationArrow,
                              color: Colors.white,
                            ),
                            label: Text('¿Como llegar aquí?',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          ))
                    ],
                  ),
                ));
          } else {
            return Center(
              child: Image.asset('assets/loadCamera.gif'),
            );
          }
        },
      ),
    );
  }
}
