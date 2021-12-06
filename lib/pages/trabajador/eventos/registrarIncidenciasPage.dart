import 'package:flutter/material.dart';
import 'package:tp_2021_app/resources/colors.dart';

class RegistrarIncidenciasPage extends StatefulWidget {
  RegistrarIncidenciasPage({Key? key}) : super(key: key);

  @override
  _RegistrarIncidenciasPageState createState() =>
      _RegistrarIncidenciasPageState();
}

class _RegistrarIncidenciasPageState extends State<RegistrarIncidenciasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        title: Text('Lista de Equipos'),
        backgroundColor: colorBlueDark2,
      ),body: Column() ,);
  }
}
