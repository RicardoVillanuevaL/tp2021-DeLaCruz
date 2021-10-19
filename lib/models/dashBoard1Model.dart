// To parse this JSON data, do
//
//     final dashBoard1Model = dashBoard1ModelFromJson(jsonString);

import 'dart:convert';

List<DashBoard1Model> dashBoard1ModelFromJson(String str) =>
    List<DashBoard1Model>.from(
        json.decode(str).map((x) => DashBoard1Model.fromJson(x)));

String dashBoard1ModelToJson(List<DashBoard1Model> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DashBoard1Model {
  DashBoard1Model({
    required this.nombreProyecto,
    required this.fecha,
    required this.hora,
    required this.direccion,
    required this.idProyecto,
    required this.idPedido,
  });

  final String nombreProyecto;
  final DateTime fecha;
  final String hora;
  final String direccion;
  final int idProyecto;
  final int idPedido;

  factory DashBoard1Model.fromJson(Map<String, dynamic> json) =>
      DashBoard1Model(
        nombreProyecto: json["NombreProyecto"],
        fecha: DateTime.parse(json["Fecha"]),
        hora: json["Hora"],
        direccion: json["Direccion"],
        idProyecto: json["IDProyecto"],
        idPedido: json["IDPedido"],
      );

  Map<String, dynamic> toJson() => {
        "NombreProyecto": nombreProyecto,
        "Fecha": fecha.toIso8601String(),
        "Hora": hora,
        "Direccion": direccion,
        "IDProyecto": idProyecto,
        "IDPedido": idPedido,
      };
}
