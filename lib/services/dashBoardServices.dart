import 'dart:convert';

import 'package:tp_2021_app/models/dashBoard1Model.dart';
import 'package:http/http.dart' as http;
import 'package:tp_2021_app/models/equiposPendientesModel.dart';
import 'package:tp_2021_app/resources/strings.dart';

class DashBoardServices {
  Future<List<DashBoard1Model>> getAllEventosTodayByEmpl(
      String fecha, int idEmpleado) async {
    var endpoint = Uri.https(
        URL, '/mobile/consulta/getAllEventosTodayByEmpl/$fecha/$idEmpleado');

    final response =
        await http.get(endpoint, headers: {"Content-Type": "application/json"});
    final List<dynamic> decodedData = json.decode(response.body);
    final List<DashBoard1Model> list = [];

    print(response.statusCode);

    if (decodedData.isNotEmpty && response.statusCode == 200) {
      decodedData.forEach((element) {
        final temp = DashBoard1Model.fromJson(element);
        list.add(temp);
      });
    }

    return list;
  }

  Future<List<DashBoard1Model>> getAllEventosMonthByEmpl(
      String fecha, int idEmpleado) async {
    var endpoint = Uri.https(
        URL, '/mobile/consulta/getAllEventosMonthByEmpl/$fecha/$idEmpleado');

    final response =
        await http.get(endpoint, headers: {"Content-Type": "application/json"});
    final List<dynamic> decodedData = json.decode(response.body);
    final List<DashBoard1Model> list = [];

    print(response.statusCode);

    if (decodedData.isNotEmpty && response.statusCode == 200) {
      decodedData.forEach((element) {
        final temp = DashBoard1Model.fromJson(element);
        list.add(temp);
      });
    }

    return list;
  }

  Future<List<EquiposPendiente>> getAllEquiposPendientes(
      String fecha, int idEmpleado) async {
    var endpoint = Uri.https(
        URL, '/mobile/consulta/getAllEquiposPendientes/$fecha/$idEmpleado');

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
}

final dashBoardServices = DashBoardServices();
