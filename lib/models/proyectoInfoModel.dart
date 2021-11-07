// To parse this JSON data, do
//
//     final proyectoInfo = proyectoInfoFromJson(jsonString);

import 'dart:convert';

List<ProyectoInfo> proyectoInfoFromJson(String str) => List<ProyectoInfo>.from(json.decode(str).map((x) => ProyectoInfo.fromJson(x)));

String proyectoInfoToJson(List<ProyectoInfo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProyectoInfo {
    ProyectoInfo({
       required this.nombre,
       required this.fecha,
       required this.hora,
       required this.direccion,
       required this.cliente,
       required this.celular,

       required this.evento
    });

    String nombre;
    DateTime fecha;
    String hora;
    String direccion;
    String cliente;
    String evento;
    String celular;

    factory ProyectoInfo.fromJson(Map<String, dynamic> json) => ProyectoInfo(
        nombre: json["Nombre"],
        fecha: DateTime.parse(json["Fecha"]),
        hora: json["Hora"],
        direccion: json["Direccion"],
        cliente: json["Cliente"],
        celular: json["Celular"],
        evento: json["Evento"]
    );

    Map<String, dynamic> toJson() => {
        "Nombre": nombre,
        "Fecha": fecha.toIso8601String(),
        "Hora": hora,
        "Direccion": direccion,
        "Cliente": cliente,
        "Celular": celular,
        "Evento": evento,
    };
}
