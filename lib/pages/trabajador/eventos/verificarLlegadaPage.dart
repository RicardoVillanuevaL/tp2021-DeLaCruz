import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tp_2021_app/core/sharedPreferences.dart';
import 'package:tp_2021_app/models/proyectoInfoModel.dart';
import 'package:tp_2021_app/pages/trabajador/eventos/registrarIncidenciasPage.dart';
import 'package:tp_2021_app/resources/colors.dart';
import 'package:tp_2021_app/resources/styles.dart';
import 'package:tp_2021_app/services/eventServices.dart';

class VerificarLlegadaPage extends StatefulWidget {
  final ProyectoInfo idEvento;
  final int id;
  VerificarLlegadaPage({Key? key, required this.idEvento, required this.id})
      : super(key: key);

  @override
  _VerificarLlegadaPageState createState() => _VerificarLlegadaPageState();
}

class _VerificarLlegadaPageState extends State<VerificarLlegadaPage> {
  final prefs = PreferenciasUsuario();

  late ProyectoInfo idProyecto;
  late int id;
  late TextEditingController controllerComentario;
  bool existeFoto = false;

  @override
  void initState() {
    idProyecto = this.widget.idEvento;
    id = this.widget.id;
    controllerComentario = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verificar Llegada al Evento'),
        backgroundColor: colorBlueDark2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                'Usted ha llegado al evento:',
                style: TextStyle(
                    color: colorBlueDark2,
                    fontSize: 24,
                    fontFamily: fontsGothic),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('Escriba un comentario: ',
                    style: TextStyle(
                      color: colorBlueDark2,
                      fontSize: 18,
                    )),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 150,
                  width: double.infinity,
                  margin: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      color: colorGray,
                      border: Border.all(color: colorBlueDark2),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.cameraRetro,
                      size: 48,
                    ),
                  ),
                ),
              ),
              Container(
                  width: 350,
                  child: TextField(
                    controller: controllerComentario,
                    maxLines: 3,
                    decoration: InputDecoration(
                        hintText: 'Escriba un comentario (opcional)'),
                  )),
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
                      if (existeFoto) {
                        eventServices.postNotificacion(
                            prefs.id,
                            'Llegada al Evento',
                            '${prefs.nombre} ${prefs.apellido} acaba de registrar su llegada al evento ${idProyecto.nombre} ');

                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Registro Exitoso!')));
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (BuildContext context) =>
                                    RegistrarIncidenciasPage()));
                      } else {
                        eventServices.postNotificacion(
                            prefs.id,
                            'Llegada al Evento',
                            '${prefs.nombre} ${prefs.apellido} acaba de registrar su llegada al evento ${idProyecto.nombre} ');

                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Registro Exitoso!')));
                        // Navigator.push(
                        //     context,
                        //     CupertinoPageRoute(
                        //         builder: (BuildContext context) =>
                        //             ListaEquiposEvento(
                        //               id: id,
                        //             )));
                      }
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.locationArrow,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Registrar Llegada',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
