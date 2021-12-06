import 'package:flutter/material.dart';
import 'package:tp_2021_app/resources/colors.dart';

class ListaEquiposEvento extends StatefulWidget {
  final int id;
  const ListaEquiposEvento({Key? key, required this.id}) : super(key: key);

  @override
  _ListaEquiposEventoState createState() => _ListaEquiposEventoState();
}

class _ListaEquiposEventoState extends State<ListaEquiposEvento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Equipos'),
        backgroundColor: colorBlueDark2,
      ),
      body: Column(
        children: [
          ItemEquipoEstado(),
          ItemEquipoEstado(),
          ItemEquipoEstado(),
          ItemEquipoEstado(),
          ItemEquipoEstado(),
          ItemEquipoEstado()
        ],
      ),
    );
  }
}

class ItemEquipoEstado extends StatefulWidget {
  const ItemEquipoEstado({Key? key}) : super(key: key);

  @override
  _ItemEquipoEstadoState createState() => _ItemEquipoEstadoState();
}

class _ItemEquipoEstadoState extends State<ItemEquipoEstado> {
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('prueba'),
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['One', 'Two', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
