// To parse this JSON data, do
//
//     final eventosAgenda = eventosAgendaFromJson(jsonString);

import 'dart:convert';

List<EventosAgenda> eventosAgendaFromJson(String str) =>
    List<EventosAgenda>.from(
        json.decode(str).map((x) => EventosAgenda.fromJson(x)));

String eventosAgendaToJson(List<EventosAgenda> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventosAgenda {
  EventosAgenda(
      {required this.id,
      required this.nombre,
      required this.fecha,
      required this.hora});

  int id;
  String nombre;
  String fecha;
  String hora;

  factory EventosAgenda.fromJson(Map<String, dynamic> json) => EventosAgenda(
      id: json["ID"],
      nombre: json["Nombre"],
      fecha: json["Fecha"],
      hora: json["Hora"] ?? '12:00');

  Map<String, dynamic> toJson() =>
      {"ID": id, "Nombre": nombre, "Fecha": fecha, "Hora": hora};
}
