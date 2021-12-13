import 'package:flutter/material.dart';
import 'package:tp_2021_app/resources/colors.dart';

class RegistrarIncidenciasPage extends StatefulWidget {
  RegistrarIncidenciasPage({Key? key}) : super(key: key);

  @override
  _RegistrarIncidenciasPageState createState() =>
      _RegistrarIncidenciasPageState();
}

class _RegistrarIncidenciasPageState extends State<RegistrarIncidenciasPage> {
  var controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    print('lib-pages-trabajador-eventos-registrarIncidenciasPage.dart');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Incidencias'),
        backgroundColor: colorBlueDark2,
      ),
      body: Column(
        children: [
          TextField(
              controller: controller,
              style: TextStyle(color: Colors.white),
              maxLines: 3,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintText: 'Reporte',
                hintStyle: TextStyle(color: Colors.white, fontSize: 18),
              )),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: colorBlueLight, borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'home', (route) => false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
