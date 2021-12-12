import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp_2021_app/core/sharedPreferences.dart';
import 'package:tp_2021_app/models/equiposModel.dart';
import 'package:tp_2021_app/models/equiposPendientesModel.dart';
import 'package:tp_2021_app/resources/colors.dart';
import 'package:tp_2021_app/resources/styles.dart';
import 'package:tp_2021_app/services/eventServices.dart';

class VerDetalleEquipos extends StatefulWidget {
  final EquiposPendiente pendiente;
  const VerDetalleEquipos({Key? key, required this.pendiente})
      : super(key: key);

  @override
  _VerDetalleEquiposState createState() => _VerDetalleEquiposState();
}

class _VerDetalleEquiposState extends State<VerDetalleEquipos> {
  final prefs = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBlueDark2,
      appBar: AppBar(
        title: Text('Lista de Equipos'),
        backgroundColor: colorBlueDark2,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            widget.pendiente.nombre,
            style: titleLoginStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Flexible(
            child: Container(
              child: FutureBuilder(
                future: eventServices.equiposListPendientes(
                    widget.pendiente.idProyecto, prefs.id),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Equipos>> snapshot) {
                  if (snapshot.hasData) {
                    var temp = snapshot.data;
                    if (temp!.length != 0) {
                      temp.forEach((element) {
                        element.estado = 'Disponible';
                      });
                      return ListView.builder(
                        itemCount: temp.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    temp[index].equipos ?? 'ABC-123',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: fontsGothic,
                                        fontSize: 16),
                                  ),
                                  DropdownButton<String>(
                                    value: temp[index].estado,
                                    icon: const Icon(Icons.arrow_downward,
                                        color: Colors.white),
                                    iconSize: 24,
                                    elevation: 16,
                                    style: const TextStyle(color: Colors.white),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.white,
                                    ),
                                    dropdownColor: colorBlueDark1,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        temp[index].estado = newValue!;
                                        print(newValue);
                                        print(temp[index].estado);
                                        eventServices.putEquipoAlquiladoID(
                                            temp[index].id!);
                                      });
                                    },
                                    items: <String>[
                                      'En Uso',
                                      'Disponible',
                                      'Mantenimiento',
                                      'No Disponible'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  )
                                ],
                              ),
                              margin: const EdgeInsets.all(12),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.white10,
                                  borderRadius: BorderRadius.circular(12)));
                        },
                      );
                    } else {
                      return Center(
                        child: Text(
                          'No tiene Equipos',
                          style: titleLoginStyle,
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
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: colorBlueLight, borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
