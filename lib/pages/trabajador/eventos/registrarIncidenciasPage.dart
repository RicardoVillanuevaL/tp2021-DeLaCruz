import 'package:flutter/material.dart';
import 'package:tp_2021_app/core/sharedPreferences.dart';
import 'package:tp_2021_app/models/equiposPendientesModel.dart';
import 'package:tp_2021_app/pages/trabajador/equipos/verDetalleEquipos.dart';
import 'package:tp_2021_app/resources/colors.dart';
import 'package:tp_2021_app/services/eventServices.dart';

class RegistrarIncidenciasPage extends StatefulWidget {
  final int proyecto;
  RegistrarIncidenciasPage({Key? key , required this.proyecto }) : super(key: key);

  @override
  _RegistrarIncidenciasPageState createState() =>
      _RegistrarIncidenciasPageState();
}

class _RegistrarIncidenciasPageState extends State<RegistrarIncidenciasPage> {
  var controller = TextEditingController();
  final prefs = PreferenciasUsuario();
  @override
  void initState() {
    super.initState();
    print('lib-pages-trabajador-eventos-registrarIncidenciasPage.dart');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Incidencias'),
        backgroundColor: colorBlueDark2,

      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: size.width -50,
            child: TextField(
                controller: controller,
                style: TextStyle(color: colorBlueDark2),
                maxLines: 3,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorBlueDark2)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorBlueDark2)),
                  hintText: 'Reporte',
                  hintStyle: TextStyle(color: colorBlueDark2, fontSize: 18),
                )),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: colorBlueLight, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  child: Text('Registrar'),
                  onPressed: () {
                    eventServices.postReporte(widget.proyecto,prefs.id,controller.text,DateTime.now().toString());
                    ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Registro Exitoso!')));
                  },
                ),
              ),
              SizedBox(width: 30),
               Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: colorBlueLight, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  child: Text('Verificar Equipos'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => VerDetalleEquipos(pendiente: EquiposPendiente(idProyecto: widget.proyecto,equipo: 1,idPedido: widget.proyecto,fecha: '',nombre: '')) ) );
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, 'home', (route) => false);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
