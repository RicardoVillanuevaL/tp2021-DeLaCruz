import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:tp_2021_app/models/calendarioModel.dart';
import 'package:tp_2021_app/models/equiposModel.dart';
import 'package:tp_2021_app/models/equiposPendientesModel.dart';
import 'package:tp_2021_app/models/eventosAgendaModel.dart';
import 'package:tp_2021_app/models/notificacionesModel.dart';
import 'package:tp_2021_app/models/pedidosModel.dart';
import 'package:tp_2021_app/models/proyectoInfoModel.dart';
import 'package:tp_2021_app/models/reporteModel.dart';
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

    Future<List<CalendarioModel>> getAllCalendario() async {
    var endpoint = Uri.https(URL,
        '/proyecto/consulta/getAllPedidosContratado');

    final response =
        await http.get(endpoint, headers: {"Content-Type": "application/json"});
    final List<dynamic> decodedData = json.decode(response.body);
    final List<CalendarioModel> list = [];

    print(response.statusCode);

    if (decodedData.isNotEmpty && response.statusCode == 200) {
      decodedData.forEach((element) {
        final temp = CalendarioModel.fromJson(element);
        list.add(temp);
      });
    }

    return list;
  }

  Future<ProyectoInfo> getInfoProyecto(int id) async {
    final List<ProyectoInfo> list = [];

    try {
      var endpoint = Uri.https(URL, '/mobile/consulta/getProyectoDetail/$id');

      final response = await http
          .get(endpoint, headers: {"Content-Type": "application/json"});
      final List<dynamic> decodedData = json.decode(response.body);

      print(response.statusCode);

      if (decodedData.isNotEmpty && response.statusCode == 200) {
        decodedData.forEach((element) {
          final temp = ProyectoInfo.fromJson(element);
          list.add(temp);
        });
      }
    } catch (e) {
      list.add(ProyectoInfo(
          cliente: resultError,
          direccion: resultError,
          evento: resultError,
          fecha: DateTime.now(),
          hora: resultError,
          nombre: resultError,
          celular: resultError));
    }

    return list[0];
  }

  Future<List<NotificacionModel>> getAllNotificaciones(int idEmpleado) async {
    var endpoint =
        Uri.https(URL, '/mobile/consulta/getNotificaciones/$idEmpleado');

    final response =
        await http.get(endpoint, headers: {"Content-Type": "application/json"});
    final List<dynamic> decodedData = json.decode(response.body);
    final List<NotificacionModel> list = [];

    print(response.statusCode);

    if (decodedData.isNotEmpty && response.statusCode == 200) {
      decodedData.forEach((element) {
        final temp = NotificacionModel.fromJson(element);
        list.add(temp);
      });
    }

    return list;
  }

  Future<List<ReporteModel>> getAllReporteID(int idEmpleado) async {
    var endpoint = Uri.https(URL, '/mobile/consulta/getReportesID/$idEmpleado');

    final response =
        await http.get(endpoint, headers: {"Content-Type": "application/json"});
    final List<dynamic> decodedData = json.decode(response.body);
    final List<ReporteModel> list = [];

    print(response.statusCode);

    if (decodedData.isNotEmpty && response.statusCode == 200) {
      decodedData.forEach((element) {
        final temp = ReporteModel.fromJson(element);
        list.add(temp);
      });
    }

    return list;
  }

  Future<List<EquiposPendiente>> getAllEquiposAsignados(int idEmpleado) async {
    var endpoint =
        Uri.https(URL, '/mobile/consulta/getAllEquiposAsignados/$idEmpleado');

    final response =
        await http.get(endpoint, headers: {"Content-Type": "application/json"});
    final List<dynamic> decodedData = json.decode(response.body);
    final List<EquiposPendiente> list = [];

    print(response.statusCode);

    if (decodedData.isNotEmpty && response.statusCode == 200) {
      decodedData.forEach((element) {
        final temp = EquiposPendiente.fromJson(element);
        list.add(temp);
      });
    }

    return list;
  }

  Future<List<Equipos>> equiposListPendientes(
      int proyecto, int idEmpleado) async {
    var endpoint = Uri.https(
        URL, '/mobile/consulta/equiposListPendientes/$proyecto/$idEmpleado');

    final response =
        await http.get(endpoint, headers: {"Content-Type": "application/json"});
    final List<dynamic> decodedData = json.decode(response.body);
    final List<Equipos> list = [];

    print(response.statusCode);

    if (decodedData.isNotEmpty && response.statusCode == 200) {
      decodedData.forEach((element) {
        final temp = Equipos.fromJson(element);
        list.add(temp);
      });
    }

    return list;
  }

  Future<dynamic> putEquipoAlquiladoID(int id) async {
    try {
      Uri endpoint = Uri.https(URL, '/mobile/actualiza/putEquipoAlquiladoID');

      final cuerpo = {'id': id};

      final resp = await http.put(endpoint, body: jsonEncode(cuerpo), headers: {
        "Content-Type": "application/json",
      });

      print(resp.body);
    } on PlatformException catch (e) {
      print('ERROR+${e.code}:${e.message}');
      return;
    }
  }

  Future<List<PedidosModel>> listaPedidosEstado(int estado) async {
    var endpoint =
        Uri.https(URL, '/voucher/consulta/getAllPedidoVoucher/$estado');

    final response =
        await http.get(endpoint, headers: {"Content-Type": "application/json"});
    final List<dynamic> decodedData = json.decode(response.body);
    final List<PedidosModel> list = [];

    print(response.statusCode);

    if (decodedData.isNotEmpty && response.statusCode == 200) {
      decodedData.forEach((element) {
        final temp = PedidosModel.fromJson(element);
        list.add(temp);
      });
    }
    return list;
  }

  Future<dynamic> postNotificacion(int id, String title, String mensaje) async {
    try {
      Uri endpoint = Uri.https(URL, '/mobile/registro/postNotificacion');

      final cuerpo = {"titulo": title, "cuerpo": mensaje, "id": id};

      final resp = await http.post(endpoint, body: jsonEncode(cuerpo), headers: {
        "Content-Type": "application/json",
      });

      print(resp.body);
    } on PlatformException catch (e) {
      print('ERROR+${e.code}:${e.message}');
      return;
    }
  }
}

final eventServices = _EventServices();
