import 'dart:io';

import 'package:camera/camera.dart';
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
  final XFile image;
  VerificarLlegadaPage({Key? key, required this.idEvento, required this.id , required this.image})
      : super(key: key);

  @override
  _VerificarLlegadaPageState createState() => _VerificarLlegadaPageState();
}

class _VerificarLlegadaPageState extends State<VerificarLlegadaPage> {
  final prefs = PreferenciasUsuario();

  

  late ProyectoInfo idProyecto;
  late int id;
  bool existeFoto = false;

  @override
  void initState() {
    super.initState();
    idProyecto = this.widget.idEvento;
    id = this.widget.id;
   
  }





  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              Container(
                height: size.height/2,
                width: double.infinity,
                margin: const EdgeInsets.all(12.0),
                child: Image.file(File(widget.image.path),fit: BoxFit.fill ,),
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
                     
                        eventServices.postNotificacion(
                            prefs.id,
                            'Llegada al Evento',
                            '${prefs.nombre} ${prefs.apellido} acaba de registrar su llegada al evento ${idProyecto.nombre} ');
                          
                        eventServices.postVerificarLlegada(prefs.id, DateTime.now().toString(), '20:30:00' , id, widget.image);

                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Registro Exitoso!')));
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (BuildContext context) =>
                                    RegistrarIncidenciasPage(proyecto: id)));
                      
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
