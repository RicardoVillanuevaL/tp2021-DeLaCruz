// To parse this JSON data, do
//
//     final pedidosModel = pedidosModelFromJson(jsonString);

import 'dart:convert';

List<PedidosModel> pedidosModelFromJson(String str) => List<PedidosModel>.from(json.decode(str).map((x) => PedidosModel.fromJson(x)));

String pedidosModelToJson(List<PedidosModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PedidosModel {
    PedidosModel({
        required this.idPed,
       required this.nombre,
        required this.fecha,
    });

    int idPed;
    String nombre;
    String fecha;

    factory PedidosModel.fromJson(Map<String, dynamic> json) => PedidosModel(
        idPed: json["IdPed"],
        nombre: json["Nombre"],
        fecha: json["Fecha"],
    );

    Map<String, dynamic> toJson() => {
        "IdPed": idPed,
        "Nombre": nombre,
        "Fecha": fecha,
    };
}
