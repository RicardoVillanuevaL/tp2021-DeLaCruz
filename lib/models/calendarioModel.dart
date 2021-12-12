// To parse this JSON data, do
//
//     final calendarioModel = calendarioModelFromJson(jsonString);

import 'dart:convert';

List<CalendarioModel> calendarioModelFromJson(String str) =>
    List<CalendarioModel>.from(
        json.decode(str).map((x) => CalendarioModel.fromJson(x)));

String calendarioModelToJson(List<CalendarioModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CalendarioModel {
  CalendarioModel({
    required this.id,
    required this.nombre,
    required this.fecha,
    required this.servicio,
    required this.evento,
    required this.cliente,
    required this.estado,
    required this.estadoPago,
  });

  int id;
  String nombre;
  String fecha;
  String servicio;
  String evento;
  String cliente;
  String estado;
  String estadoPago;

  factory CalendarioModel.fromJson(Map<String, dynamic> json) =>
      CalendarioModel(
        id: json["ID"]??0,
        nombre: json["Nombre"]??'Matrimonio Elsa y Carlos',
        fecha: json["Fecha"]??'2021-1',
        servicio: json["Servicio"] ?? 'Filmacion' ,
        evento: json["Evento"] ?? 'Matrimonio',
        cliente: json["Cliente"] ?? 'Katya Vergaray',
        estado: json["Estado"] ?? 'Inicializado',
        estadoPago: json["EstadoPago"] ?? 'Contratado',
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Nombre": nombre,
        "Fecha": fecha,
        "Servicio": servicio,
        "Evento": evento,
        "Cliente": cliente,
        "Estado": estado,
        "EstadoPago": estadoPago,
      };
}
