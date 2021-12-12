// To parse this JSON data, do
//
//     final equipos = equiposFromJson(jsonString);

import 'dart:convert';

List<Equipos> equiposFromJson(String str) => List<Equipos>.from(json.decode(str).map((x) => Equipos.fromJson(x)));

String equiposToJson(List<Equipos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Equipos {
    Equipos({
        this.id,
        this.equipos,
        this.estado
    });

    int? id;
    String? equipos;
    String? estado;

    factory Equipos.fromJson(Map<String, dynamic> json) => Equipos(
        id: json["id"],
        equipos: json["equipos"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "equipos": equipos,
    };
}
