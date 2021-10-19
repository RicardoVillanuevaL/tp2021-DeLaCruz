import 'dart:convert';

import 'package:tp_2021_app/models/eventModel.dart';
import 'package:http/http.dart' as http;

class _EventServices {
  Map<dynamic, dynamic> header = {};

  _EventServices() {
    header = {"Content-Type": "application/json"};
  }

  Future<List<EventModel>> getAllEventos() async {
    var endpoint = Uri.https(
        'tp2021database.herokuapp.com', '/eventos/consulta/getAllEventos');

    final response =
        await http.get(endpoint, headers: {"Content-Type": "application/json"});
    final List<dynamic> decodedData = json.decode(response.body);
    final List<EventModel> list = [];

    if (decodedData.isEmpty && response.statusCode == 200) {
      decodedData.forEach((element) {
        final temp = EventModel.fromJson(element);
        list.add(temp);
      });
    }

    return list;
  }
}

final eventServices = _EventServices();
