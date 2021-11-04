import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tp_2021_app/models/eventosAgendaModel.dart';
import 'package:tp_2021_app/models/proyectoInfoModel.dart';
import 'package:tp_2021_app/resources/strings.dart';

class _EventServices {
  Map<dynamic, dynamic> header = {};

  _EventServices() {
    header = {"Content-Type": "application/json"};
  }

  Future<List<EventosAgenda>> getAllEventosAgenda(
      String fecha, int idEmpleado) async {
    var endpoint = Uri.https(URL,
        '/mobile/consulta/getAllEventosProgramadosByEmpl/$fecha/$idEmpleado');

    final response =
        await http.get(endpoint, headers: {"Content-Type": "application/json"});
    final List<dynamic> decodedData = json.decode(response.body);
    final List<EventosAgenda> list = [];

    print(response.statusCode);

    if (decodedData.isNotEmpty && response.statusCode == 200) {
      decodedData.forEach((element) {
        final temp = EventosAgenda.fromJson(element);
        list.add(temp);
      });
    }

    return list;
  }

  Future<ProyectoInfo> getInfoProyecto(
      int id) async {
    final List<ProyectoInfo> list = [];
  
  try {
      var endpoint = Uri.https(URL,
        '/mobile/consulta/getProyectoDetail/$id');

    final response =
        await http.get(endpoint, headers: {"Content-Type": "application/json"});
    final List<dynamic> decodedData = json.decode(response.body);

    print(response.statusCode);

    if (decodedData.isNotEmpty && response.statusCode == 200) {
      decodedData.forEach((element) {
        final temp = ProyectoInfo.fromJson(element);
        list.add(temp);
      });
    }
  } catch (e) {
    list.add(ProyectoInfo(cliente: resultError,direccion: resultError,evento: resultError,fecha: DateTime.now(),hora: resultError,nombre: resultError));
  }

    return list[0];
  }

}

final eventServices = _EventServices();
